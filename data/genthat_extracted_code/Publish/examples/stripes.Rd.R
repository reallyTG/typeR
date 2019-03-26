library(Publish)


### Name: stripes
### Title: Background and grid color control.
### Aliases: stripes
### Keywords: survival

### ** Examples



plot(0,0)
backGround(bg="beige",fg="red",vertical=0,horizontal=0)

plot(0,0)
stripes(col=c("yellow","green"),gridcol="red",xlim=c(-1,1),horizontal=seq(0,1,.1))
stripes(col=c("yellow","green"),gridcol="red",horizontal=seq(0,1,.1))




