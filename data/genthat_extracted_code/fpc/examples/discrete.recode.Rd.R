library(fpc)


### Name: discrete.recode
### Title: Recodes mixed variables dataset
### Aliases: discrete.recode
### Keywords: manip

### ** Examples

  set.seed(776655)
  v1 <- rnorm(20)
  v2 <- rnorm(20)
  d1 <- sample(c(2,4,6,8),20,replace=TRUE)
  d2 <- sample(1:4,20,replace=TRUE)
  ldata <- cbind(v1,d1,v2,d2)
  lc <-
  discrete.recode(ldata,xvarsorted=FALSE,continuous=c(1,3),discrete=c(2,4))
  require(MASS)
  data(Cars93)
  Cars934 <- Cars93[,c(3,5,8,10)]
  cc <- discrete.recode(Cars934,xvarsorted=FALSE,continuous=c(2,3),discrete=c(1,4))



