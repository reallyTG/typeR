library(far)


### Name: select.fdata
### Title: Subscript of fdata
### Aliases: select.fdata
### Keywords: manip

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

  print(data1)
  print(data1.X <- select.fdata(data1,name="X"))
  print(data2 <- select.fdata(data1,date=paste((1:5)*5)))
  date.fdata(data2)



