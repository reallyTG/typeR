library(lmomco)


### Name: pargpaRC
### Title: Estimate the Parameters of the Generalized Pareto Distribution
###   with Right-Tail Censoring
### Aliases: pargpaRC
### Keywords: distribution (parameters) Distribution: Generalized Pareto
###   data censoring

### ** Examples

n         <- 60 # samplesize
para      <- vec2par(c(1500,160,.3),type="gpa") # build a GPA parameter set
fakedata  <- quagpa(runif(n),para) # generate n simulated values
threshold <- 1700 # a threshold to apply the simulated censoring
fakedata  <- sapply(fakedata,function(x) { if(x > threshold)
                                           return(threshold) else return(x) })
lmr       <- lmoms(fakedata) # Ordinary L-moments without considering
                             # that the data is censored
estpara   <- pargpa(lmr) # Estimated parameters of parent

pwm2     <- pwmRC(fakedata,threshold=threshold) # compute censored PWMs
typeBpwm <- pwm2$Bbetas # the B-type PWMs
zeta     <- pwm2$zeta # the censoring fraction

cenpara <- pargpaRC(pwm2lmom(typeBpwm),zeta=zeta) # Estimated parameters
F       <- nonexceeds() # nonexceedance probabilities for plotting purposes

# Visualize some data
plot(F,quagpa(F,para), type='l', lwd=3) # The true distribution
lines(F,quagpa(F,estpara), col=3) # Green estimated in the ordinary fashion
lines(F,quagpa(F,cenpara), col=2) # Red, consider that the data is censored
# now add in what the drawn sample looks like.
PP <- pp(fakedata) # plotting positions of the data
points(PP,sort(fakedata)) # sorting is needed!
# Interpretation. You should see that the red line more closely matches
# the heavy black line. The green line should be deflected to the right
# and pass through the values equal to the threshold, which reflects the
# much smaller L-skew of the ordinary L-moments compared to the type-B
# L-moments.

# Assertion, given some PWMs or L-moments, if zeta=1 then the parameter
# estimates must be identical. The following provides a demonstration.
para1 <- pargpaRC(pwm2lmom(typeBpwm),zeta=1)
para2 <- pargpa(pwm2lmom(typeBpwm))
str(para1); str(para2)

# Assertion as previous assertion, let us trigger different optimizer
# algorithms with a non-NULL xi parameter and see if the two parameter
# lists are the same.
para1 <- pargpaRC(pwm2lmom(typeBpwm), zeta=zeta)
para2 <- pargpaRC(pwm2lmom(typeBpwm), xi=para1$para[1], zeta=zeta)
str(para1); str(para2)



