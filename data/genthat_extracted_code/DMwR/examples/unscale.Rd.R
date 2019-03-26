library(DMwR)


### Name: unscale
### Title: Invert the effect of the scale function
### Aliases: unscale
### Keywords: models

### ** Examples

data(algae)
normData <- scale(algae[,4:12])
t <- rpartXse(a1 ~ .,as.data.frame(normData[1:100,]))
normPs <- predict(t,as.data.frame(normData[101:nrow(normData),]))
ps <- unscale(normPs,normData)
## Not run: 
##D  plot(algae[101:nrow(algae),'a1'],ps)
## End(Not run)



