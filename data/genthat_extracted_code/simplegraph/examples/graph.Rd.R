library(simplegraph)


### Name: graph
### Title: Create a graph
### Aliases: graph

### ** Examples

funcs <- graph(list(
  drop_internal = character(0),
  get_deps = c("get_description", "parse_deps",
    "%||%", "drop_internal"),
  get_description = "pkg_from_filename",
  parse_deps = "str_trim",
  cran_file = c("get_pkg_type", "r_minor_version", "cran_file"),
  download_urls = c("split_pkg_names_versions", "cran_file"),
  filename_from_url = character(0),
  get_pkg_type = character(0),
  pkg_download = c("dir_exists", "download_urls",
    "filename_from_url", "try_download"),
  r_minor_version = character(0),
  try_download = character(0),
  drop_missing_deps = character(0),
  install_order = character(0),
  restore = c("pkg_download", "drop_missing_deps",
    "install_order", "get_deps"),
  snap = character(0),
  `%||%` = character(0),
  data_frame = character(0),
  dir_exists = character(0),
  pkg_from_filename = character(0),
  split_pkg_names_versions = "data_frame",
  str_trim = character(0)
))
funcs

vertices <- data.frame(
  stringsAsFactors = FALSE,
  name = c("Tom Hanks", "Cate Blanchett", "Matt Damon", "Kate Winslet",
    "Saving Private Ryan", "Contagion", "The Talented Mr. Ripley"),
  what = c("actor", "actor", "actor", "actor", "movie", "movie", "movie"),
  born = c("1956-07-09", "1966-05-26", "1970-10-08", "1975-10-05",
    NA, NA, NA),
  gender = c("M", "F", "M", "F", NA, NA, NA),
  year = c(NA, NA, NA, NA, 1998, 2011, 1999)
)

edges <- data.frame(
  stringsAsFactors = FALSE,
  actor = c("Tom Hanks", "Cate Blanchett", "Matt Damon", "Matt Damon",
    "Kate Winslet"),
  movie = c("Saving Private Ryan", "The Talented Mr. Ripley",
    "Saving Private Ryan", "The Talented Mr. Ripley", "Contagion")
)
actors <- graph(vertices, edges)
actors



