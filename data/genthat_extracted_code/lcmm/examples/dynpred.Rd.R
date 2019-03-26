library(lcmm)


### Name: dynpred
### Title: Individual dynamic predictions from a joint latent class model
### Aliases: dynpred

### ** Examples



## Joint latent class model with 2 classes :
m32 <- Jointlcmm(Ydep1~Time*X1,mixture=~Time,random=~Time,subject="ID",
classmb=~X3,ng=2,survival=Surv(Tevent,Event)~X1+mixture(X2),
hazard="3-quant-splines",hazardtype="PH",data=data_lcmm,
B = c(0.641, -0.6217, 0, 0, 0.5045, 0.8115, -0.4316, 0.7798, 0.1027, 
0.7704, -0.0479, 10.4257, 11.2972, -2.5955, -0.5234, 1.4147, 
-0.05, 0.9124, 0.0501, 0.2138, 1.5027))

## Predictions at landmark 10 and 12 for horizon 3, 5 and 10 for two subjects :

dynpred(m32,landmark=c(10,12),horizon=c(3,5,10),var.time="Time",
fun.time=function(x){10*x},newdata=data_lcmm[1:8,])
## Not run: 
##D dynpred(m32,landmark=c(10,12),horizon=c(3,5,10),var.time="Time",
##D fun.time=function(x){10*x},newdata=data_lcmm[1:8,],draws=TRUE,ndraws=2000)
## End(Not run)




