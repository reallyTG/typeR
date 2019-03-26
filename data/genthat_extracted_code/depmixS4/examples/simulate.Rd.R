library(depmixS4)


### Name: simulate
### Title: Methods to simulate from (dep-)mix models
### Aliases: simulate simulate,response-method simulate,mix-method
###   simulate,depmix-method simulate,GLMresponse-method
###   simulate,transInit-method simulate,BINOMresponse-method
###   simulate,GAMMAresponse-method simulate,MULTINOMresponse-method
###   simulate,MVNresponse-method simulate,NORMresponse-method
###   simulate,POISSONresponse-method
### Keywords: methods

### ** Examples


y <- rnorm(1000)
respst <- c(0,1,2,1)
trst <- c(0.9,0.1,0.1,0.9)

df <- data.frame(y=y)

mod <- depmix(y~1,data=df,respst=respst,trst=trst,inst=c(0.5,0.5),nti=1000,nst=2)

mod <- simulate(mod)




