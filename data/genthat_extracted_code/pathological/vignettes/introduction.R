## ---- Setup, echo = FALSE, results = "hide"------------------------------
set.seed(19790801)
knitr::opts_chunk$set(error = FALSE)

## ---- inconsistent_return------------------------------------------------
tempdir()
R.home()

## ---- standardized_wrappers----------------------------------------------
library(pathological)
temp_dir()
r_home()

## ---- vectorized_wrappers------------------------------------------------
r_home(c("home", "bin", "share"), c("", "i386", "zoneinfo"))

## ---- wrapper_data, echo = FALSE, results = "asis"-----------------------
wrapper_data <- data.frame(
  "base/utils" = c("choose.files, file.choose", "choose.dir", "dir.create", "file.create", "file.copy", ".libPaths", "R.home", "Sys.which", "system.file", "tempdir", "tempfile"),
  pathological = c("choose_files", "choose_dir", "copy_dir", "create_dirs", "create_files", "get_libraries", "r_home", "sys_which", "system_file", "temp_dir", "temp_file"),
  stringsAsFactors = FALSE
)
wrapper_data$pathological <- paste0(
  "[", wrapper_data$pathological,
  "](https://www.rdocumentation.org/packages/pathlogical/topics/", 
  wrapper_data$pathological, ")"
)
knitr::kable(wrapper_data)

## ---- decompose_path-----------------------------------------------------
x <- c("foo.tgz", "bar.tar.gz", "baz")
withr::with_dir(
  temp_dir(),
  decompose_path(x)
)

## ---- split_path---------------------------------------------------------
split_path(r_home())
split_path(r_home(), simplify = TRUE)

## ---- split_dir, results = "hide"----------------------------------------
split_dir(r_home())

## ---- r_profile_site-----------------------------------------------------
r_profile_site()
r_profile()

