library(mrgsolve)


### Name: nmxml
### Title: Get THETA, OMEGA and SIGMA from a completed NONMEM run
### Aliases: nmxml NMXML

### ** Examples


if(requireNamespace("xml2")) {
  proj <- system.file("nonmem", package = "mrgsolve")
  mrgsolve:::nmxml(run = 1005, project = proj)
}




