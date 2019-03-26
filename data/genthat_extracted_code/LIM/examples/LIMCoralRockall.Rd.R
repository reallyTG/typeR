library(LIM)


### Name: LIMCoralRockall
### Title: Linear inverse model specification for the Deep-water Coral food
###   web at Rockall Bank
### Aliases: LIMCoralRockall
### Keywords: datasets

### ** Examples

Coral <- Flowmatrix(LIMCoralRockall)

plotweb(Coral, main = "Deep Water Coral Foodweb, Rockall Bank",
        sub = "mmolC/m2/day", lab.size = 0.8)


## Not run: 
##D xr <- LIMCoralRockall$NUnknowns
##D i1 <- 1:(xr/2)
##D i2 <- (xr/2+1):xr
##D 
##D pm <- par(mfrow = c(1, 1))
##D Simplest <- Ldei(LIMCoralRockall)$X
##D Ranges <- Xranges(LIMCoralRockall)
##D Plotranges(Ranges[i1, 1], Ranges[i1, 2], Simplest[i1], lab.cex = 0.7,
##D         main = "Deep Water Coral - ranges part 1")
##D 
##D Plotranges(Ranges[i2, 1], Ranges[i2, 2], Simplest[i2], lab.cex = 0.7,
##D         main = "Deep Water Coral - ranges part 2")
##D par(mfrow = pm)
## End(Not run)



