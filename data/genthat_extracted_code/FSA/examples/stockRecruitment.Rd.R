library(FSA)


### Name: stockRecruitment
### Title: Creates a function for a specific parameterization of a common
###   stock-recruitment function .
### Aliases: stockRecruitment srFuns srFunShow
### Keywords: manip

### ** Examples

## See the formulae
## Simple Examples
# show what a message looks like with the function definition
srFuns("Ricker",msg=TRUE)

# create some dummy stock data
stock <- seq(0.01,1000,length.out=199)

# Beverton-Holt #1 parameterization
( bh1 <- srFuns() )
plot(bh1(stock,a=0.5,b=0.01)~stock,type="l",lwd=2,ylab="Recruits",xlab="Spawners",ylim=c(0,50))

# Ricker #1 parameterization
( r1 <- srFuns("Ricker") )
lines(r1(stock,a=0.5,b=0.005)~stock,lwd=2,col="red")

# Shephered parameterization
( s1 <- srFuns("Shepherd") )
lines(s1(stock,a=0.5,b=0.005,c=2.5)~stock,lwd=2,col="blue")

# Saila-Lorda parameterization
( sl1 <- srFuns("SailaLorda") )
lines(sl1(stock,a=0.5,b=0.005,c=1.05)~stock,lwd=2,col="salmon")

## Examples of fitting stock-recruitment functions
# Fitting the Beverton-Holt #1 parameterization with multiplicative errors
bh1s <- srStarts(recruits~stock,data=CodNorwegian)
fit1 <- nls(log(recruits)~log(bh1(stock,a,b)),data=CodNorwegian,start=bh1s)
summary(fit1,correlation=TRUE)
plot(recruits~stock,data=CodNorwegian,pch=19,xlim=c(0,200))
curve(bh1(x,a=coef(fit1)[1],b=coef(fit1)[2]),from=0,to=200,col="red",lwd=3,add=TRUE)

# Fitting the Ricker #3 parameterization with multiplicative errors
r3 <- srFuns("Ricker",param=3)
r3s <- srStarts(recruits~stock,data=CodNorwegian,type="Ricker",param=3)
fit2 <- nls(log(recruits)~log(r3(stock,a,Rp)),data=CodNorwegian,start=r3s)
summary(fit2,correlation=TRUE)
curve(r3(x,a=coef(fit2)[1],Rp=coef(fit2)[2]),from=0,to=200,col="blue",lwd=3,add=TRUE)

#############################################################################
## Create expressions of the functions
#############################################################################
# Simple example
srFunShow()
srFunShow(plot=TRUE)
srFunShow("BevertonHolt",1,plot=TRUE)

# Get and save the expression
( tmp <- srFunShow("BevertonHolt",1) )
# Use expression as title on a plot
plot(bh1(stock,a=0.5,b=0.01)~stock,type="l",ylim=c(0,50),
     ylab="Recruits",xlab="Spawners",main=tmp)
# Put expression in the main plot
text(800,10,tmp)
# Put multiple expressions on a plot
op <- par(mar=c(0.1,0.1,0.1,0.1))
plot(0,type="n",xlab="",ylab="",xlim=c(0,1),ylim=c(0,3),xaxt="n",yaxt="n")
text(0,2.5,"Beverton-Holt #1:",pos=4)
text(0.5,2.5,srFunShow("BevertonHolt",1))
text(0,1.5,"Ricker #2:",pos=4)
text(0.5,1.5,srFunShow("Ricker",2))
text(0,0.5,"Shepherd:",pos=4)
text(0.5,0.5,srFunShow("Shepherd"))
par(op)



