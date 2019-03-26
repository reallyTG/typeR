library(far)


### Name: far
### Title: FARX(1) model estimation
### Aliases: far plot.far print.far
### Keywords: models ts

### ** Examples

  # Simulation of a FARX process
  data1 <- simul.farx(m=10,n=400,base=base.simul.far(20,5),
                base.exo=base.simul.far(20,5),
                d.a=matrix(c(0.5,0),nrow=1,ncol=2),
                alpha.conj=matrix(c(0.2,0),nrow=1,ncol=2),
                d.rho=diag(c(0.45,0.90,0.34,0.45)),
                alpha=diag(c(0.5,0.23,0.018)),
                d.rho.exo=diag(c(0.45,0.90,0.34,0.45)),
                cst1=0.0)

  # Cross validation (joined and separate)
  model1.cv <- far.cv(data=data1, y="X", x="Z", kn=8, ncv=10, cvcrit="X",
                center=FALSE, na.rm=FALSE, joined=TRUE)
  model2.cv <- far.cv(data=data1, y="X", x="Z", kn=c(4,4), ncv=10, cvcrit="X",
                center=FALSE, na.rm=FALSE, joined=FALSE)
  print(model1.cv)
  print(model2.cv)
  k1 <- model1.cv$minL2[1]
  k2 <- model2.cv$minL2[1:2]

  # Modelization of the FARX process (joined and separate)
  model1 <- far(data=data1, y="X", x="Z", kn=k1,
                center=FALSE, na.rm=FALSE, joined=TRUE)
  model2 <- far(data=data1, y="X", x="Z", kn=k2,
                center=FALSE, na.rm=FALSE, joined=FALSE)
  print(model1)
  print(model2)



