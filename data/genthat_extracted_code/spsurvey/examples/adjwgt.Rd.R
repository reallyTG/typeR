library(spsurvey)


### Name: adjwgt
### Title: Adjust Initial Survey Design Weights
### Aliases: adjwgt
### Keywords: survey misc

### ** Examples

sites <- as.logical(rep(rep(c("TRUE","FALSE"), c(9,1)), 5))
wgt <- runif(50, 10, 100)
wtcat <- rep(c("A","B"), c(30, 20))
framesize <- c(1650, 1100)
names(framesize) <- c("A","B")
adjwgt(sites, wgt, wtcat, framesize)



