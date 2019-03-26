library(nsRFA)


### Name: DISTPLOTS
### Title: Empirical distribution plots
### Aliases: DISTPLOTS plotpos plotposRP loglogplot unifplot normplot
###   lognormplot studentplot logisplot gammaplot expplot paretoplot
###   gumbelplot frechetplot weibullplot plotposRPhist pointspos
###   pointsposRP loglogpoints unifpoints normpoints studentpoints
###   logispoints gammapoints exppoints gumbelpoints weibullpoints
###   regionalplotpos regionalnormplot regionallognormplot regionalexpplot
###   regionalparetoplot regionalgumbelplot regionalfrechetplot
###   pointsposRPhist
### Keywords: hplot

### ** Examples

x <- rnorm(30,10,2)
plotpos(x)
normplot(x)
normplot(x,xlab=expression(D[m]),ylab=expression(hat(F)),
         main="Normal plot",cex.main=1,font.main=1)
normplot(x,line=FALSE)

x <- rlnorm(30,log(100),log(10))
normplot(x)
lognormplot(x)

x <- rand.gumb(30,1000,100)
normplot(x)
gumbelplot(x)

x <- rnorm(30,10,2)
y <- rnorm(50,10,3)
z <- c(x,y)
codz <- c(rep(1,30),rep(2,50))
regionalplotpos(z,codz)
regionalnormplot(z,codz,xlab="z")
regionallognormplot(z,codz)
regionalgumbelplot(z,codz)

plotpos(x)
pointspos(y,pch=2,col=2)

x <- rnorm(50,10,2)
F <- seq(0.01,0.99,by=0.01)
qq <- qnorm(F,10,2)
plotpos(x)
pointspos(qq,type="l")

normplot(x,line=FALSE)
normpoints(x,type="l",lty=2,col=3)

lognormplot(x)
normpoints(x,type="l",lty=2,col=3)

gumbelplot(x)
gumbelpoints(x,type="l",lty=2,col=3)

# distributions comparison in probabilistic graphs
x <- rnorm(50,10,2)
F <- seq(0.001,0.999,by=0.001)
loglikelhood <- function(param) {-sum(dgamma(x, shape=param[1], 
                scale=param[2], log=TRUE))}
parameters <- optim(c(1,1),loglikelhood)$par
qq <- qgamma(F,shape=parameters[1],scale=parameters[2])
plotpos(x)
pointspos(qq,type="l")

normplot(x,line=FALSE)
normpoints(qq,type="l")

lognormplot(x,line=FALSE)
normpoints(qq,type="l")




