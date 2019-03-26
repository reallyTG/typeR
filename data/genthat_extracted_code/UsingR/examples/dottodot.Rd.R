library(UsingR)


### Name: dottodot
### Title: Dot-to-dot puzzle
### Aliases: dottodot
### Keywords: datasets

### ** Examples

data(dottodot)
# make a blank graph
plot(y~x,data=dottodot,type="n",bty="n",xaxt="n",xlab="",yaxt="n",ylab="")
# add the points
points(y~x,data=dottodot)
# add the labels using pos argument
with(dottodot, text(x,y,labels=ind,pos=pos))
# solve the puzzle
lines(y~x, data=dottodot)



