library(spatstat.data)


### Name: longleaf
### Title: Longleaf Pines Point Pattern
### Aliases: longleaf
### Keywords: datasets spatial

### ** Examples

    data(longleaf)
  if(require(spatstat)) {
    plot(longleaf)
    plot(cut(longleaf, breaks=c(0,30,Inf), labels=c("Sapling","Adult")))
  }



