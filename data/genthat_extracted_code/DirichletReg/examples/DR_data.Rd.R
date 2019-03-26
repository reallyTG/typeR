library(DirichletReg)


### Name: DirichletRegData
### Title: Prepare Compositional Data
### Aliases: DirichletRegData DR_data print.DirichletRegData
###   summary.DirichletRegData
### Keywords: manip

### ** Examples

# create a DirichletRegData object from the Arctic Lake data
head(ArcticLake[, 1:3])
AL <- DR_data(ArcticLake[, 1:3])
summary(AL)
head(AL)



