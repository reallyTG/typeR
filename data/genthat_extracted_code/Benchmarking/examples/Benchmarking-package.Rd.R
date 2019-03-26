library(Benchmarking)


### Name: Benchmarking-package
### Title: Data Envelopment Analyses (DEA) and Stochastic Frontier Analyses
###   (SFA) - Model Estimations and Efficiency Measuring
### Aliases: Benchmarking-package Benchmarking
### Keywords: package models efficiency

### ** Examples

# Plot of different technologies
x <- matrix(c(100,200,300,500),ncol=1,dimnames=list(LETTERS[1:4],"x"))
y <- matrix(c(75,100,300,400),ncol=1,dimnames=list(LETTERS[1:4],"y"))
dea.plot(x,y,RTS="vrs",ORIENTATION="in-out",txt=rownames(x))
dea.plot(x,y,RTS="drs",ORIENTATION="in-out",add=TRUE,lty="dashed",lwd=2)
dea.plot(x,y,RTS="crs",ORIENTATION="in-out",add=TRUE,lty="dotted")
                      
dea.plot(x,y,RTS="fdh",ORIENTATION="in-out",txt=rownames(x),main="fdh")
dea.plot(x,y,RTS="irs",ORIENTATION="in-out",txt=TRUE,main="irs")
dea.plot(x,y,RTS="irs2",ORIENTATION="in-out",txt=rownames(x),main="irs2")
dea.plot(x,y,RTS="add",ORIENTATION="in-out",txt=rownames(x),main="add")

#  A quick frontier with 1 input and 1 output
dea.plot(x,y, main="Basic plot of frontier")

# Calculating efficiency
dea(x,y, RTS="vrs", ORIENTATION="in")
e <- dea(x,y, RTS="vrs", ORIENTATION="in")
e
eff(e)
peers(e)
peers(e, NAMES=TRUE)
print(peers(e, NAMES=TRUE), quote=FALSE)
lambda(e)
summary(e)


# Calculating super efficiency
esuper <- sdea(x,y, RTS="vrs", ORIENTATION="in")
esuper
print(peers(esuper,NAMES=TRUE),quote=FALSE)
# Technology for super efficiency for firm number 3/C 
# Note that drop=FALSE is necessary for XREF and YREF to be matrices
# when one of the dimensions is or is reduced to 1.
e3 <- dea(x,y, XREF=x[-3,,drop=FALSE], YREF=y[-3,,drop=FALSE])
dea.plot(x[-3],y[-3],RTS="vrs",ORIENTATION="in-out",txt=LETTERS[c(1,2,4)])
points(x[3],y[3],cex=2)
text(x[3],y[3],LETTERS[3],adj=c(-.75,.75))
e3 <- dea(x,y, XREF=x[-3,,drop=FALSE], YREF=y[-3,,drop=FALSE])
eff(e3)
peers(e3)
print(peers(e3,NAMES=TRUE),quote=FALSE)
lambda(e3)
e3$lambda

# Taking care of slacks
x <- matrix(c(100,200,300,500,100,600),ncol=1,
        dimnames=list(LETTERS[1:6],"x"))
y <- matrix(c(75,100,300,400,50,400),ncol=1,
        dimnames=list(LETTERS[1:6],"y"))

# Phase one, calculate efficiency
e <- dea(x,y)
print(e)
peers(e)
lambda(e)
# Phase two, calculate slacks (maximize sum of slacks)
sl <- slack(x,y,e)
data.frame(sl$sx,sl$sy)
peers(sl)
lambda(sl)
sl$lambda
summary(sl)

# The two phases in one function call
e2 <- dea(x,y,SLACK=TRUE)
print(e2)
data.frame(eff(e2),e2$slack,e2$sx,e2$sy,lambda(e2))
peers(e2)
lambda(e2)
e2$lambda



