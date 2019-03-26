library(paleoMAS)


### Name: akaike.l
### Title: Loess regression parameters selection through AIC minimization
###   for one taxon
### Aliases: akaike.l
### Keywords: models robust

### ** Examples

data(modernq)
# Calculate percentages
perq<-percenta(modernq,first=2,last=39)[,2:55]
akaike.l(modernq[,1],perq[,3])
akaike.l(modernq[,1],perq[,3],parameters=TRUE)



