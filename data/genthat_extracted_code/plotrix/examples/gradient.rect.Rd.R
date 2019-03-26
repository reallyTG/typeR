library(plotrix)


### Name: gradient.rect
### Title: Display a rectangle filled with an arbitrary color gradient
### Aliases: gradient.rect
### Keywords: misc

### ** Examples

 # get an empty box
 plot(0:10,type="n",axes=FALSE)
 # run across the three primaries
 gradient.rect(1,0,3,6,reds=c(1,0),
  greens=c(seq(0,1,length=10),seq(1,0,length=10)),
  blues=c(0,1),gradient="y")
 # now a "danger gradient"
 gradient.rect(4,0,6,6,c(seq(0,1,length=10),rep(1,10)),
  c(rep(1,10),seq(1,0,length=10)),c(0,0),gradient="y")
 # now just a smooth gradient across the bar
 gradient.rect(7,0,9,6,col=smoothColors("red",38,"blue"),border=NA)



