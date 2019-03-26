library(McSpatial)


### Name: kdensity 
### Title: K-density functions for distances between geographic coordinates
### Aliases: 'kdensity '
### Keywords: Density Functions Nonparametric

### ** Examples

data(matchdata)
lmat <- cbind(matchdata$longitude,matchdata$latitude)
# Smaller sample to reduce computation time for example
set.seed(18493)
obs <- sample(seq(1,nrow(lmat)),400)
lmat <- lmat[obs,]
fit95 <- kdensity(lmat[,1],lmat[,2],noplot=FALSE)



