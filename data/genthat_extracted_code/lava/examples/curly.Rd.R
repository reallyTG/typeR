library(lava)


### Name: curly
### Title: Adds curly brackets to plot
### Aliases: curly

### ** Examples

if (interactive()) {
plot(0,0,type="n",axes=FALSE,xlab="",ylab="")
curly(x=c(1,0),y=c(0,1),lwd=2,text="a")
curly(x=c(1,0),y=c(0,1),lwd=2,text="b",theta=pi)
curly(x=-0.5,y=0,shape=1,theta=pi,text="c")
curly(x=0,y=0,shape=1,theta=0,text="d")
curly(x=0.5,y=0,len=0.2,theta=pi/2,col="blue",lty=2)
curly(x=0.5,y=-0.5,len=0.2,theta=-pi/2,col="red",shape=1e3,text="e")
}



