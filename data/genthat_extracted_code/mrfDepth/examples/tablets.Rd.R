library(mrfDepth)


### Name: tablets
### Title: Near Infrared Spectroscopy responses for a batch of pills
### Aliases: tablets
### Keywords: datasets

### ** Examples

data(tablets)
par(mfrow=c(3,1))
matplot(tablets[,,1], type="l", lty=1, col = "black")
matplot(tablets[,,2], type="l", lty=1, col = "black")
matplot(tablets[,,3], type="l", lty=1, col = "black")
par(mfrow=c(1,1))



