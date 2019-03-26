library(magclass)


### Name: dimSums
### Title: Summation over dimensions
### Aliases: dimSums

### ** Examples


  test<-as.magpie(array(1:4,dim=c(2,2)))
  dimSums(test,dim=c(1,3))
  dimSums(test[,,1],na.rm=TRUE,dim=c(1,2))
  




