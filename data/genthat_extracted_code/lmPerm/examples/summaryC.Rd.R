library(lmPerm)


### Name: summaryC
### Title: Coefficient summary from aovp
### Aliases: summaryC
### Keywords: htest

### ** Examples

	data(Alfalfa)
	summaryC(aovp(Yield~Variety*Date+Error(Block/Variety),Alfalfa))


