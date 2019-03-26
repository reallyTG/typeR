library(openintro)


### Name: heartTr
### Title: Heart Transplant Data
### Aliases: heartTr
### Keywords: datasets heart transplant categorical data contingency tables
###   randomization tests

### ** Examples

data(heartTr)
str(heartTr) 
boxPlot(heartTr$survtime, heartTr$transplant,
	ylab = 'Survival Time (days)')
mosaicplot(~ transplant + survived, data = heartTr)



