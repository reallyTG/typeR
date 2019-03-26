library(VBLPCM)


### Name: gof.vblpcm
### Title: Goodness of fit based on simulations from the fitted object.
### Aliases: gof.vblpcm
### Keywords: degree distribution

### ** Examples

data(sampson,package="VBLPCM")
v.start<-vblpcmstart(samplike,G=3,model="rreceiver",LSTEPS=1e3)
v.fit<-vblpcmfit(v.start,STEPS=20)
### plot the mean posterior positions
plot(v.fit, R2=0.05,main="Sampson's Monks: VB with Receiver Effects")
### Look at gof plots
plot(gof(v.fit,GOF=~distance,nsim=50))



