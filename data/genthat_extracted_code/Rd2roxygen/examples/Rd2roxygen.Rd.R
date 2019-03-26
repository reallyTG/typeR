library(Rd2roxygen)


### Name: Rd2roxygen
### Title: Convert all the Rd files of a package to roxygen comments
### Aliases: Rd2roxygen

### ** Examples

## a demo package
pkg = system.file("examples", "pkgDemo", package = "Rd2roxygen")
file.copy(pkg, tempdir(), recursive = TRUE)  # copy to temp dir first
od = setwd(tempdir())

## take a look at original R scripts
file.show("pkgDemo/R/foo.R")

options(roxygen.comment = "##' ")

## convert Rd's under man to roxygen comments
Rd2roxygen(file.path(tempdir(), "pkgDemo"))

file.show("pkgDemo/R/foo.R")  # what happened to foo.R and bar.R?

setwd(od)  # restore working directory



