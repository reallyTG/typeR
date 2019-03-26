strip_dots <- function(x) {
  x[grep("^[.]", names(x))] <- NULL
  x
}
