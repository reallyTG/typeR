library(lmomco)


### Name: z.par2qua
### Title: Blipping Quantile Functions
### Aliases: z.par2qua
### Keywords: quantile function blipping distributions

### ** Examples

# define the real parent (or close)
the.gpa   <- vec2par(c(100,1000,0.1),type='gpa')
fake.data <- rlmomco(30,the.gpa) # simulate some data
fake.data <- sort(c(fake.data, rep(0,10))) # add some zero observations

par(mgp=c(3,0.5,0)) # going to tick to the inside, change some parameters
# next compute the parameters for the positive data
gpa.all <- pargpa(lmoms(fake.data))
gpa.nzo <- pargpa(lmoms(fake.data[fake.data > 0]))
n   <- length(fake.data) # sample size
p   <- length(fake.data[fake.data == 0])/n # est. prob of zero value
F   <- nonexceeds(sig6=TRUE); F <- sort(c(F,p)); qF <- qnorm(F)
PP  <- pp(fake.data) # compute plotting positions of sim. sample
plot(qnorm(PP), fake.data, ylim=c(0,4000), xaxt="n", xlab="") # plot the sample
add.lmomco.axis(las=2, tcl=0.5, twoside=TRUE, side.type="SNV", otherside.type="NA")
lines(qF,quagpa(F,gpa.all)) # the parent (without zeros)
lines(qF,z.par2qua(F,p,gpa.nzo),lwd=3) # fitted model with zero conditional
par(mgp=c(3,1,0)) # restore defaults



