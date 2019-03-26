library(macc)


### Name: sim.data.single
### Title: Generate single-level simulation data
### Aliases: sim.data.single
### Keywords: datagen

### ** Examples

  ###################################################
  # Generate a single-level dataset

  # covariance matrix of errors
  delta<-0.5
  Sigma<-matrix(c(1,2*delta,2*delta,4),2,2)

  # model coefficients
  A0<-0.5
  B0<--1
  C0<-0.5

  Theta<-matrix(c(A0,0,C0,B0),2,2)

  # number of trials
  n<-100

  # generate a treatment assignment vector
  set.seed(100)
  Z<-matrix(rbinom(n,size=1,0.5),n,1)

  # Data
  set.seed(5000)
  data.single<-sim.data.single(Z,Theta,Sigma)
  ###################################################



