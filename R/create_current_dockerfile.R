#' Creates a dockerfile that mirrors the current environment
#'
#' @param file `String` output dockerfile location and name, defaults to "Dockerfile"
#'
#' @export
#' @return `String` output dockerfile location and name
#'
#'
#' @examples
#' \dontrun{
#' create_current_dockerfile()
#' }
create_current_dockerfile <- function(file = "Dockerfile"){
  # Gets the current R version
  ver <- strsplit(R.version.string, split=" ")[[1]][3]

  dockerfile() %>%
    set_from(paste("rocker/r-ver:", ver)) %>%
    add_environ_packages() %>%
    set_cmd("[\"R\"]") %>%
    write_dockerfile(file = file, overwrite = TRUE)

}
