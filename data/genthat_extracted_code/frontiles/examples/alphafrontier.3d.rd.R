library(frontiles)


### Name: alphafrontier.3d
### Title: 3d representation of alpha-quantile frontier in the case of 2
###   input and 1 output.
### Aliases: alphafrontier.3d
### Keywords: robust multivariate

### ** Examples

data(spain)
xyn<-cbind(spain[,3:4],spain[,1])
xtab<-as.matrix(xyn[,c(1,2)])
ytab<-matrix(xyn[,3])

# representation in 2-d

op <- par(no.readonly = TRUE) # the whole list of settable par's.
alphafrontier.3d(xtab,ytab, type="output", alpha=0.6, xlab="input 1",
 ylab="input 2",main="blabla") 
points(xtab,pch=16)
par(op)

# alphafrontier.3d(xtab,ytab,type="output", alpha=0.6, xlab="input 1",
# ylab="input 2",main="blabla", rgl=TRUE) 
# aspect3d(1,1,1)

####  second exemple
#data(charnes1981)
#x <- with(charnes1981, cbind(x1,x2))
#y <- with(charnes1981, y1)
#front_out_plot_3d(x,y,alpha=0.8, xlab="input 1",ylab="input 2",main="blabla") 
#front_out_plot_3d(x,y,alpha=0.8, xlab="input 1",ylab="input 2",main="blabla",
# rgl=TRUE) 

#points(x,pch=16)
#abline(h=x[,2],v=x[,1],lty=2)

# representation in 3-d
#res<-front_out_plot_3d(xtab,ytab,type='3d',xlab="input 1",ylab="input 2",
#zlab="output",main=bquote(paste(alpha,"-quantile output frontier with ",
#alpha,"=.95")))
#res$points3d(xtab[,1],xtab[,2],ytab,type='h')



