library(ChemoSpecUtils)


### Name: removeGroup
### Title: Remove a Group from a Spectra or Spectra2D Object
### Aliases: removeGroup
### Keywords: utilities

### ** Examples

if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(SrE.IR)

  sumGroups(SrE.IR)
  SrE.IRa <- removeGroup(SrE.IR, rem.group = "pSrE")
  sumGroups(SrE.IRa)
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)

  sumGroups(MUD1)
  MUD1a <- removeGroup(MUD1, rem.group = "GroupA")
  sumGroups(MUD1a)
}




