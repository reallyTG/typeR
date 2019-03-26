library(ChemoSpecUtils)


### Name: chkSpectra
### Title: Verify the Integrity of a Spectra or Spectra2D Object
### Aliases: chkSpectra
### Keywords: classes utilities

### ** Examples

if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(SrE.IR)
  chkSpectra(SrE.IR)
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)
  chkSpectra(MUD1)
}




