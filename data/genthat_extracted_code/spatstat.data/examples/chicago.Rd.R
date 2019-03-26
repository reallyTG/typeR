library(spatstat.data)


### Name: chicago
### Title: Chicago Crime Data
### Aliases: chicago
### Keywords: datasets spatial

### ** Examples

data(chicago)
  if(require(spatstat)) {
plot(chicago)
plot(as.linnet(chicago), main="Chicago Street Crimes",col="green")
plot(as.ppp(chicago), add=TRUE, col="red", chars=c(16,2,22,17,24,15,6))
  }



