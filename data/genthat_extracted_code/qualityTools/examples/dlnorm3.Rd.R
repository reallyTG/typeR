library(qualityTools)


### Name: lnorm3
### Title: The Lognormal Distribution (3 Parameter)
### Aliases: lnorm3 dlnorm3 plnorm3 qlnorm3
### Keywords: Distribution Identification

### ** Examples

#Simple Example
dlnorm3(x=2,meanlog=0,sdlog=1/8,threshold=1)
temp=plnorm3(q=2,meanlog=0,sdlog=1/8,threshold=1)
temp
qlnorm3(p=temp,meanlog=0,sdlog=1/8,threshold=1)
#
##Visualized Example
##prepare screen
#dev.new()
#split.screen(matrix(c(0,0.5,0,1, 0.5,1,0,1),byrow=TRUE,ncol=4))
##generate values 
#x=seq(0,4,length=1000)
##plot different density functions
#screen(1)                                                                              
#plot(x,y=dlnorm3(x,0,1/8,1),col="green",xlim=c(0,3),type="l",lwd=2,xlab="x",
#     ylab="f(x)",main="Density Function of Log-Normal-Distribution")
#lines(x,y=dlnorm3(x,0,0.5,0),lwd=2,col="red")
#lines(x,y=dlnorm3(x,0,1,0),lwd=2,col="blue")
#lines(x,y=dlnorm3(x,1,1/8,0),lwd=2,col="orange")
##add legend
#legend("topleft",legend=c(expression(paste(zeta," = 0 ")*
#       paste(sigma, " = 1/8 ")*paste(theta," = 1")),
#       expression(paste(zeta," = 0 ")*paste(sigma, " = 0.5 ")*
#       paste(theta," = 0")),expression(paste(zeta," = 0 ")*
#       paste(sigma, " = 1 ")*paste(theta," = 0")),
#       expression(paste(zeta," = 1 ")*paste(sigma, " = 1/8 ")*
#       paste(theta," = 0"))),col=c("green","red","blue","orange"),
#       text.col="black",lwd=2,bty="o",inset=0.04)
#abline(v=0,lty=2,col="grey")
#abline(h=0,lty=2,col="grey")
##plot different distribution functions
#screen(2)
#plot(x,y=plnorm3(x,0,1/8,1),col="green",xlim=c(0,3),type="l",lwd=2,xlab="x",
#     ylab="F(x)",
#     main="Cumulative Distribution Function of Log-Normal-Distribution")
#lines(x,y=plnorm3(x,0,0.5,0),lwd=2,col="red")
#lines(x,y=plnorm3(x,0,1,0),lwd=2,col="blue")
#lines(x,y=plnorm3(x,1,1/8,0),lwd=2,col="orange")
##add legend
#legend("topleft",legend=c(expression(paste(zeta," = 0 ")*
#       paste(sigma, " = 1/8 ")*paste(theta," = 1")),
#       expression(paste(zeta," = 0 ")*paste(sigma, " = 0.5 ")*
#       paste(theta," = 0")),expression(paste(zeta," = 0 ")*
#       paste(sigma, " = 1 ")*paste(theta," = 0")),
#       expression(paste(zeta," = 1 ")*paste(sigma, " = 1/8 ")*
#       paste(theta," = 0"))),col=c("green","red","blue","orange"),
#       text.col="black",lwd=2,bty="o",inset=0.04)
#abline(v=0,lty=2,col="grey")
#abline(h=0,lty=2,col="grey")
#close.screen(all=TRUE)



