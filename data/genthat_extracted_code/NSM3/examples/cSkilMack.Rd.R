library(NSM3)


### Name: cSkilMack
### Title: Computes a critical value for the Skillings-Mack SM
###   distribution.
### Aliases: cSkilMack
### Keywords: Skillings-Mack

### ** Examples

##Hollander, Wolfe, Chicken Example 7.8 Effect of Rhythmicity of a Metronome on Speech Fluency
obs.mat<-matrix(c(rep(1,10),0,rep(1,13)),ncol=3,byrow=TRUE)
#cSkilMack(.01,obs.mat)
cSkilMack(.01,obs.mat,n.mc=5000)



