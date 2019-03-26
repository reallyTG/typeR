library(far)


### Name: predict.kerfon
### Title: Forecasting of functional kernel model
### Aliases: predict.kerfon
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

  # Cross validation
  model1 <- kerfon(data=data1, x="X", r=10, na.rm=TRUE)
	print(model1)

  # Predicting values
  pred1 <- predict(model1,newdata=select.fdata(data1,date=1:399))
  # Persistence
  persist1 <- pred.persist(select.fdata(data1,date=1:399),x="X")
  # Real values
  real1 <- select.fdata(data1,date=2:400)

  errors0 <- persist1[[1]]-real1[[1]]
  errors1 <- pred1[[1]]-real1[[1]]

  # Norm of observations
  summary(real1)
  # Persistence
  summary(as.fdata(errors0))
  # kerfon model
  summary(as.fdata(errors1))



