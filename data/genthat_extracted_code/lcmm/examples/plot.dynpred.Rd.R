library(lcmm)


### Name: plot.dynpred
### Title: Plot of individual dynamic predictions
### Aliases: plot.dynpred

### ** Examples



## Not run: 
##D 
##D ## Joint latent class model with 2 classes :
##D m32 <- Jointlcmm(Ydep1~Time*X1,mixture=~Time,random=~Time,subject="ID",
##D classmb=~X3,ng=2,survival=Surv(Tevent,Event)~X1+mixture(X2),
##D hazard="3-quant-splines",hazardtype="PH",data=data_lcmm,B = c(0.64, -0.62, 
##D 0, 0, 0.52, 0.81, 0.41, 0.78, 0.1, 0.77, -0.05, 10.43, 11.3, -2.6, -0.52, 1.41, 
##D -0.05, 0.91, 0.05, 0.21, 1.5))
##D 
##D ## Predictions at landmark 10 and 12 for horizon 3, 5 and 10 for two subjects :
##D dynpred.m32 <- dynpred(m32,landmark=c(10,12),horizon=c(3,5,10),var.time="Time",
##D fun.time=function(x){10*x},newdata=data_lcmm[4:8,],draws=TRUE,ndraws=2000)
##D 
##D ## Plot of the predictions at landmark 10 for horizon 3,5,10 :
##D plot(dynpred.m32,landmark=10)
##D 
##D ## Plot of the predictions at landmark 10 and 12 for horizon 3 :
##D plot(dynpred.m32,horizon=3)
## End(Not run)




