library(forestHES)


### Name: mcIntosh
### Title: Calculation of mcIntosh diversity index
### Aliases: mcIntosh

### ** Examples

######Calculation based on multiple plots
####convert raw data to species matrix
##raw data of multiple plots
data(herbdata)
herb.spematrix<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",inner="abundance")
##compute species mcIntosh diversity index for each plot
herb.mcIntosh<-mcIntosh(herb.spematrix)
herb.mcIntosh



