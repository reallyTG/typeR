library(VBLPCM)


### Name: predict.vblpcm
### Title: Find all link probabilities
### Aliases: predict.vblpcm

### ** Examples

data(sampson)
v.fit<-vblpcmfit(vblpcmstart(samplike,G=3))
### create a matrix of link posterior probabilities given the fitted model
probs<-predict.vblpcm(v.fit)
# show this graphically; separation of the boxes implies a good fit to the data
boxplot(split(probs,v.fit$Y),
        ylab=expression(paste("P(",Y[i][j],"=1)")),xlab=expression(paste(Y[i][j])))



