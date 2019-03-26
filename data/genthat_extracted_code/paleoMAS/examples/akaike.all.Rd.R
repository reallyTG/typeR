library(paleoMAS)


### Name: akaike.all
### Title: LOESS regression parameters selection through AIC minimization
###   for multiple taxa
### Aliases: akaike.all
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
akaike.all(modernq[,1],perq[,1:10])




