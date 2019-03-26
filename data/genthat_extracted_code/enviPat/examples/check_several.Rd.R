library(enviPat)


### Name: check_several
### Title: Check for overlapping molecules.
### Aliases: check_several

### ** Examples

data(isotopes)
data(chemforms)
pattern<-isopattern(
  isotopes,
  chemforms,
  threshold=0.1,
  plotit=TRUE,
  charge=FALSE,
  emass=0.00054858,
  algo=1
)
check_several(pattern,dmz=0.001,ppm=FALSE)



