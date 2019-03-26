library(far)


### Name: predict.far
### Title: Forecasting of FARX(1) model
### Aliases: predict.far
### Keywords: ts methods

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

  # Predicting values
  pred1 <- predict(model1,newdata=data1)
  pred2 <- predict(model2,newdata=data1)
  # Persistence
  persist1 <- pred.persist(select.fdata(data1,date=1:399),x="X")
  # Real values
  real1 <- select.fdata(data1,date=2:400)

  errors0 <- persist1[[1]]-real1[[1]]
  errors1 <- pred1[[1]]-real1[[1]]
  errors2 <- pred2[[1]]-real1[[1]]

  # Norm of observations
  summary(real1)
  # Persistence
  summary(as.fdata(errors0))
  # FARX models
  summary(as.fdata(errors1))
  summary(as.fdata(errors2))



