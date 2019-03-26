library(ChemoSpecUtils)


### Name: removeSample
### Title: Remove Samples from a Spectra or Spectra2D Object
### Aliases: removeSample
### Keywords: utilities

### ** Examples

if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(SrE.IR)

  # Remove the 9th spectrum/sample:
  SrE.IR$names
  SrE.IRa <- removeSample(SrE.IR, rem.sam = 9)
  SrE.IRa$names

  # Removes a spectrum/sample with this exact name:
  SrE.IRb <- removeSample(SrE.IR, rem.sam = "NW_adSrE")
  SrE.IRb$names
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)
  
  # Removes the 5th spectrum:
  MUD1$names
  MUD1a <- removeSample(MUD1, rem.sam = 5)
  MUD1a$names

  # Removes a spectrum/sample with this exact name:
  MUD1$names
  MUD1b <- removeSample(MUD1, rem.sam = "Sample6")
  MUD1b$names
}




