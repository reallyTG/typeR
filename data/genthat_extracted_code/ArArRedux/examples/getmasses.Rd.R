library(ArArRedux)


### Name: getmasses
### Title: Select a subset of isotopes from a dataset
### Aliases: getmasses getmasses.default getmasses.timeresolved
###   getmasses.logratios getmasses.redux

### ** Examples

kfile <- system.file("K-glass.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
mk <- loaddata(kfile,masses)
lk <- fitlogratios(blankcorr(mk,"EXB#","K:"),"Ar40")
k <- getmasses(lk,"Ar39","Ar40") # subset of the relevant isotopes
plotcorr(k)



