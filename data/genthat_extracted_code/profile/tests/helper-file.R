read_inst_rprof <- function(path) {
  read_inst(path, read_rprof)
}

read_inst_pprof <- function(path) {
  read_inst(path, read_pprof)
}

read_inst <- function(path, reader) {
  search_path <- file.path(c("samples", "inst/samples"), path)
  full_path <- system.file(search_path, package = "profile")
  reader(full_path[[1]])
}
