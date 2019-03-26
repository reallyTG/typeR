library(spatstat.data)


### Name: lansing
### Title: Lansing Woods Point Pattern
### Aliases: lansing
### Keywords: datasets spatial

### ** Examples

     data(lansing)
  if(require(spatstat)) {
     plot(lansing)
     summary(lansing)
     plot(split(lansing))
     plot(split(lansing)$maple)
  }



