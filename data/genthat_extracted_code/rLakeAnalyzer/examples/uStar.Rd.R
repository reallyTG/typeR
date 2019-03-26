library(rLakeAnalyzer)


### Name: uStar
### Title: Calculates the water friction velocity, uStar
### Aliases: uStar
### Keywords: manip

### ** Examples



  wndSpeed  <- c(5.1,6.3,6.3,5.2,7,7.2)
  wndHeight	<-	2
  averageEpiDense	<- c(14,15,14.2,13,12,12)

  cat('uStar for input vector is: ')
  cat(uStar(wndSpeed,wndHeight,averageEpiDense))



