library(TSclust)


### Name: diss.MINDIST.SAX
### Title: Symbolic Aggregate Aproximation related functions
### Aliases: diss.MINDIST.SAX diss.SAX PAA convert.to.SAX.symbol
###   MINDIST.SAX SAX.plot
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(12349)
n = 100
x <- rnorm(n)  #generate sample series, white noise and a wiener process
y <- cumsum(rnorm(n))
w <- 20 #amount of equal-sized frames to divide the series, parameters for PAA
alpha <- 4 #size of the alphabet, parameter for SAX

#normalize
x <- (x - mean(x)) /sd(x)
y <- (y - mean(y)) /sd(y)

paax <- PAA(x, w) #generate PAA reductions
paay <- PAA(y, w)

plot(x, type="l", main="PAA reduction of series x") #plot an example of PAA reduction
p <- rep(paax,each=length(x)/length(paax)) #just for plotting the PAA
lines(p, col="red")

#repeat the example with y
plot(y, type="l", main="PAA reduction of series y") 
py <- rep(paay,each=length(y)/length(paay))
lines(py, col="blue")

#convert to SAX representation
SAXx <- convert.to.SAX.symbol( paax, alpha)
SAXy <- convert.to.SAX.symbol( paay, alpha)

#CALC THE SAX DISTANCE
MINDIST.SAX(SAXx, SAXy, alpha, n)

#this whole process can be computed using diss.MINDIST.SAX
diss.MINDIST.SAX(x, y, w, alpha, plot=TRUE)

z <- rnorm(n)^2

diss(rbind(x,y,z), "MINDIST.SAX", w, alpha)

SAX.plot( as.ts(cbind(x,y,z)), w=w, alpha=alpha)




