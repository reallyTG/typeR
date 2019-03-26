library(VBLPCM)


### Name: VBLPCM-package
### Title: VBLPCM: Variational Bayes for the Latent Position Cluster Model
###   for networks
### Aliases: VBLPCM-package VBLPCM
### Keywords: graphs networks variational package models latentnet

### ** Examples

### Sampson's monks with sender random effects ###
data(sampson,package="VBLPCM")
v.start<-vblpcmstart(samplike,G=3,model="rreceiver",LSTEPS=1e3)
v.fit<-vblpcmfit(v.start,STEPS=20)
### plot the mean posterior positions ###
plot(v.fit, R2=0.05,main="Sampson's Monks: VB with Receiver Random Effects")
### Who's in each group?  ###
vblpcmgroups(v.fit)

### Look at a goodness-of-fit plot ###
plot(gof(v.fit,GOF=~distance))

### create a matrix of link posterior probabilities given the fitted model ###
probs<-predict.vblpcm(v.fit)
### create a boxplot goodness-of-fit graphic ###
boxplot(split(probs,as.sociomatrix(samplike)))

### run a bigger example, using the likelihood sampler set to 0.1 ###
### ## Not run:
##  data(aids,package="VBLPCM")
##  v.start<-vblpcmstart(aids.net,G=7,model="rsender",d=3)
##  use the case-control sampler with 10 controls per case
##  v.fit<-vblpcmfit(v.start,NC=10)
### plot the mean posterior positions ###
##  plot(v.fit, R2=0.1,main="Aids Blogs with Sender Random Effects")

### Use ROC / AUC to get a measure of model fit to the data ###
##  vblpcmroc(v.fit)
## End(Not run)



