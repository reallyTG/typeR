library(ChemoSpecUtils)


### Name: updateGroups
### Title: Update Group Names in a Spectra or Spectra2D Object
### Aliases: updateGroups

### ** Examples


if (requireNamespace("ChemoSpec", quietly = TRUE)) {
  library("ChemoSpec")
  data(metMUD1)
  metMUD1a <- updateGroups(metMUD1) # reports old groups
  metMUD1a <- updateGroups(metMUD1, new.grps = c("C", "T"))
}

if (requireNamespace("ChemoSpec2D", quietly = TRUE)) {
  library("ChemoSpec2D")
  data(MUD1)
  MUD1a <- updateGroups(MUD1, new.grps = c("control", "treatment"))
}




