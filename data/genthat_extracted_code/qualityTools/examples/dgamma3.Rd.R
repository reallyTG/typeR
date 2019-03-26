library(qualityTools)


### Name: gamma3
### Title: The gamma Distribution (3 Parameter)
### Aliases: gamma3 dgamma3 pgamma3 qgamma3
### Keywords: Distribution Identification

### ** Examples

##Simple Example
dgamma3(x=1,scale=1,shape=5,threshold=0)
temp=pgamma3(q=1,scale=1,shape=5,threshold=0)
temp
qgamma3(p=temp,scale=1,shape=5,threshold=0)
#
##Visualized Example
##prepare screen
#dev.new()
#split.screen(matrix(c(0,0.5,0,1, 0.5,1,0,1),byrow=TRUE,ncol=4))
##generate values
#x=seq(0,3,length=1000)
##plot different density functions
#screen(1)
#plot(x,y=dgamma3(x,threshold=0,shape=0.5,scale=1),col="green",
#     xlim=c(0,2.5),ylim=c(0,2.5),type="l",lwd=2,xlab="x",
#     ylab="f(x)",main="Density Function of gamma-Distribution")
#lines(x,y=dgamma3(x,threshold=0,shape=1,scale=1),lwd=2,col="red")
#lines(x,y=dgamma3(x,threshold=0,shape=1.5,scale=2),lwd=2,col="blue")
#lines(x,y=dgamma3(x,threshold=0,shape=5,scale=1),lwd=2,col="orange")
##add legend
#legend("topright",legend=c(expression(paste(alpha, " = 1 ")*
#       paste(c, " = 0.5 ")*paste(zeta," = 0")),
#       expression(paste(alpha, " = 1 ")*paste(c, " = 1 ")*
#       paste(zeta," = 0")),expression(paste(alpha, " = 2 ")*
#       paste(c, " = 1.5 ")*paste(zeta," = 0")),
#       expression(paste(alpha, " = 1 ")*paste(c, " = 5 ")*
#       paste(zeta," = 0"))),col=c("green","red","blue","orange"),
#       text.col="black",lwd=2,bty="0",inset=0.04)
#abline(v=0,lty=2,col="grey")
#abline(h=0,lty=2,col="grey")
##plot different distribution functions
#screen(2)
#plot(x,y=pgamma3(x,threshold=0,shape=0.5,scale=1),col="green",
#     xlim=c(0,2.5),ylim=c(0,1),type="l",lwd=2,xlab="x",ylab="F(x)",
#     main="Cumulative Distribution Function of gamma-Distribution")
#lines(x,y=pgamma3(x,threshold=0,shape=1,scale=1),lwd=2,col="red")
#lines(x,y=pgamma3(x,threshold=0,shape=1.5,scale=2),lwd=2,col="blue")
#lines(x,y=pgamma3(x,threshold=0,shape=5,scale=1),lwd=2,col="orange")
##add legend
#legend("bottomright",legend=c(expression(paste(alpha, " = 1 ")*
#       paste(c, " = 0.5 ")*paste(zeta," = 0")),
#       expression(paste(alpha, " = 1 ")*paste(c, " = 1 ")*
#       paste(zeta," = 0")),expression(paste(alpha, " = 2 ")*
#       paste(c, " = 1.5 ")*paste(zeta," = 0")),
#       expression(paste(alpha, " = 1 ")*paste(c, " = 5 ")*
#       paste(zeta," = 0"))),col=c("green","red","blue","orange"),
#       text.col="black",lwd=2,bty="0",inset=0.04)
#abline(v=0,lty=2,col="grey")
#abline(h=0,lty=2,col="grey")
#close.screen(all=TRUE)



