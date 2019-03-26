library(far)


### Name: coef.far
### Title: Extract Model Coefficients
### Aliases: coef.far
### Keywords: algebra

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

  # Modelization of the FARX process (joined and separate)
  model1 <- far(data1,kn=4,joined=TRUE)
  model2 <- far(data1,kn=c(3,1),joined=FALSE)

  # Calculation of the theoretical coefficients
  coef.theo <- theoretical.coef(m=10,base=base.simul.far(20,5),
                base.exo=base.simul.far(20,5),
                d.a=matrix(c(0.5,0),nrow=1,ncol=2),
                alpha.conj=matrix(c(0.2,0),nrow=1,ncol=2),
                d.rho=diag(c(0.45,0.90,0.34,0.45)),
                alpha=diag(c(0.5,0.23,0.018)),
                d.rho.exo=diag(c(0.45,0.90,0.34,0.45)),
                cst1=0.0)

  # Joined coefficient
  round(coef(model1),2)
  coef.theo$rho.T

  # Separate coefficient
  round(coef(model2),2)
  coef.theo$rho.X.Z



