library(diffobj)


### Name: as.character,DiffSummary-method
### Title: Generate Character Representation of DiffSummary Object
### Aliases: as.character,DiffSummary-method

### ** Examples

as.character(
  summary(diffChr(letters, letters[-c(5, 15)], format="raw", pager="off"))
)



