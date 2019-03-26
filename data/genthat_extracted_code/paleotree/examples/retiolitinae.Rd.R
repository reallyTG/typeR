library(paleotree)


### Name: retiolitinae
### Title: Cladogram and Range Data for the Retiolitinae
### Aliases: retiolitinae retioRanges retioTree retioChar
### Keywords: datasets

### ** Examples


#load data
data(retiolitinae)

#Can plot discrete time interval diversity curve with retioRanges
taxicDivDisc(retioRanges)

#Can plot the unscaled cladogram
plot(retioTree)
#Can plot the determinant growth character on the cladogram
tiplabels(pch = 16,col = (retioChar[,2]+1),adj = 0.25)

#Use basic time-scaling (terminal branches only go to FADs)
ttree <- bin_timePaleoPhy(tree = retioTree,timeList = retioRanges,type = "basic",
	ntrees = 1,plot = TRUE)

#Note that this function creates stochastic time-scaled trees...
	#A sample of 1 is not representative!

#phylogenetic diversity curve
phyloDiv(ttree)





