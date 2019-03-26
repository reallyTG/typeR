library(magicaxis)


### Name: magclip
### Title: Magical sigma clipping
### Aliases: magclip
### Keywords: sigma clip

### ** Examples

#A highly contaminated Normal distribution:
temp=c(rnorm(1e3),runif(500,-10,10))
magplot(density(temp))
lines(seq(-5,5,len=1e3),dnorm(seq(-5,5,len=1e3)),col='red')

magplot(density(magclip(temp)$x))
lines(seq(-5,5,len=1e3),dnorm(seq(-5,5,len=1e3)),col='red')

#Now we put the contamination on the high side:

temp=c(rnorm(1e3),runif(500,0,10))
magplot(density(magclip(temp)$x))
lines(seq(-5,5,len=1e3),dnorm(seq(-5,5,len=1e3)),col='red')

magplot(density(magclip(temp, estimate='lo')$x))
lines(seq(-5,5,len=1e3),dnorm(seq(-5,5,len=1e3)),col='red')



