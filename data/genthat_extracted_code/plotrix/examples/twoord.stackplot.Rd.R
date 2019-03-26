library(plotrix)


### Name: twoord.stackplot
### Title: Multiple (stack) plot with two ordinates
### Aliases: twoord.stackplot
### Keywords: misc

### ** Examples

# plot data
#

time <- 0:25

A <- 1+1/2*sin(time/2)
B <- A + rnorm(length(A), sd=1/10)
B <- B + rnorm(length(A), sd=1/10)

sizeA <- floor(450*(1 + 1/4*sin(time/2+2))*(1+.1))
sizeB <- 1000-sizeA

C <- (A*sizeA + B*sizeB)/(sizeA+sizeB)


#typical usage 
#

twoord.stackplot(lx=time, rx=time, ldata=cbind(sizeA, sizeB), 
	rdata=cbind(A, B, C),  lcol=c("grey80", "white"), 
	rcol=c("blue", "red","black"), ltype="bar", rtype=c("l","p","o"), 
	border="grey80", lylab="Size", rylab="A,B,C", xlab="Time", 
	main="a plot", incrylim=2/100)

#add a legend
#

par(xpd=TRUE) #extend the area of plotting
par(new=TRUE) #to add new graph "layers"
plot(0:1, 0:1, type="n", xlab="",ylab="", axes=FALSE) #redo the x/y limits

#first legend
legend(-0.18, 1.2, leg=c("Size A", "Size B"), fill=c("grey80", "white")) 
#second legend
legend(.97, -0.08, leg=c("A", "B", "C"), col=c("blue", "red","black"), 
	pch=c(NA, 19, 19), lty=c(1,NA,1)) 

par(xpd=FALSE, new=FALSE) #default setting



#reverse the order of plotting
twoord.stackplot(lx=time, rx=time, ldata=cbind(sizeA, sizeB), 
	rdata=cbind(A, B, C),  lcol=c("grey80", "white"), 
	rcol=c("blue", "red","black"), ltype="bar", rtype=c("l","p","o"), 
	border="grey80", lylab="Size", rylab="A,B,C", xlab="Time", 
	main="a plot", incrylim=2/100, leftfront=TRUE)




