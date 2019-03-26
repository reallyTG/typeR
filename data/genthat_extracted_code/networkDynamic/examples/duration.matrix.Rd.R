library(networkDynamic)


### Name: duration.matrix
### Title: Construct a edge spells list from base network and toggle list.
### Aliases: duration.matrix

### ** Examples

  library(networkDynamic)
  # duration matrix test
  net <-network.initialize(3)
  net[1,2]<-1;
  net[2,3]<-1;
  net[1,3]<-1;
  class(net)
  # toggle list: time, tail, head
  tog=matrix(c(1,1,2, 1,2,3, 2,1,2, 4,1,3, 4,1,2), ncol=3, byrow=TRUE)
  networkDynamic:::duration.matrix(net, tog, 0, 5)



