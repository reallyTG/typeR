library(testthat)
library(gWidgets2)
options(guiToolkit="RGtk2")

f <- list.files(system.file("tests", package="gWidgets2"), full=T)
f <- Filter(function(x) !grepl("README", x), f)
f <- Filter(function(x) !grepl("html", x), f)

sapply(f, function(i) {
  message("testing ", i)
  source(i)
})
