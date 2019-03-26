library(paleoMAS)


### Name: bcrossv.all
### Title: LOESS regression parameters selection through bootstrap
###   cross-validation for multiple taxa
### Aliases: bcrossv.all
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
bcrossv.all(modernq[,1],perq[,1:5],trials=c(10,0.1),target="rse")
bcrossv.all(modernq[,1],perq[,1:5],trials=c(10,0.1),target="rmse")



