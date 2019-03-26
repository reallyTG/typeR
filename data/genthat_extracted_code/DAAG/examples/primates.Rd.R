library(DAAG)


### Name: primates
### Title: Primate Body and Brain Weights
### Aliases: primates
### Keywords: datasets

### ** Examples

attach(primates)
plot(x=Bodywt, y=Brainwt, pch=16,
       xlab="Body weight (kg)", ylab="Brain weight (g)",
       xlim=c(5,300), ylim=c(0,1500))
chw <- par()$cxy[1]
chh <- par()$cxy[2]
text(x=Bodywt+chw, y=Brainwt+c(-.1,0,0,.1,0)*chh,
       labels=row.names(primates), adj=0)
detach(primates)



