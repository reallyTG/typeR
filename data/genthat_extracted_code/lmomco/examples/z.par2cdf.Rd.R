library(lmomco)


### Name: z.par2cdf
### Title: Blipping Cumulative Distribution Functions
### Aliases: z.par2cdf
### Keywords: cumulative distribution function blipping distributions

### ** Examples

set.seed(21)
the.gpa   <- vec2par(c(100,1000,0.1),type='gpa')
fake.data <- rlmomco(30,the.gpa) # simulate some data
fake.data <- sort(c(fake.data,rep(0,10))) # add some zero observations
# going to tick to the inside and title right axis as well, so change some
# plotting parameters
par(mgp=c(3,0.5,0), mar=c(5,4,4,3))
# next compute the parameters for the positive data
gpa.all <- pargpa(lmoms(fake.data))
gpa.nzo <- pargpa(lmoms(fake.data[fake.data > 0]))
n   <- length(fake.data) # sample size
p   <- length(fake.data[fake.data == 0])/n # est. prob of zero value
F   <- nonexceeds(sig6=TRUE); F <- sort(c(F,p)); qF <- qnorm(F)
# The following x vector obviously contains zero, so no need to insert it.
x   <- seq(-100, max(fake.data)) # absurd for x<0, but testing implementation
PP  <- pp(fake.data) # compute plotting positions of sim. sample
plot(fake.data, qnorm(PP), xlim=c(0,4000), yaxt="n", ylab="") # plot the sample
add.lmomco.axis(las=2, tcl=0.5, side=2, twoside=FALSE,
                                        side.type="NPP", otherside.type="SNV")
lines(quagpa(F,gpa.all), qF) # the parent (without zeros)
cdf <- qnorm(z.par2cdf(x,p,gpa.nzo))
cdf[! is.finite(cdf)] <- min(fake.data,qnorm(PP)) # See above documentation
lines(x, cdf,lwd=3) # fitted model with zero conditional
# now repeat the above code over and over again and watch the results
par(mgp=c(3,1,0), mar=c(5,4,4,2)+0.1) # restore defaults



