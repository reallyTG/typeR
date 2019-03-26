library(far)


### Name: pred.persist
### Title: Forecasting using functional persistence
### Aliases: pred.persist
### Keywords: ts misc

### ** Examples

  # Simulation of a FARX process
  data1 <- simul.farx(m=10,n=40,base=base.simul.far(20,5),
                base.exo=base.simul.far(20,5),
                d.a=matrix(c(0.5,0),nrow=1,ncol=2),
                alpha.conj=matrix(c(0.2,0),nrow=1,ncol=2),
                d.rho=diag(c(0.45,0.90,0.34,0.45)),
                alpha=diag(c(0.5,0.23,0.018)),
                d.rho.exo=diag(c(0.45,0.90,0.34,0.45)),
                cst1=0.0)
  print(data2 <- pred.persist(data1,x="X",label="41"))
  print(unclass(select.fdata(data1,date=paste(38:40)))$X)
  print(unclass(select.fdata(data2,date=paste(39:41))))



