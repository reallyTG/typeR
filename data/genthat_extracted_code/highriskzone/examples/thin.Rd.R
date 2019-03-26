library(highriskzone)


### Name: thin
### Title: Thinning of the observations (for evaluating the method)
### Aliases: thin

### ** Examples

 data(craterB)
 thdata <- thin(craterB, nxprob=0.1)
 thdata
 plot(thdata$observed); points(thdata$unobserved, col=4)



