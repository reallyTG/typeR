library(fitDRC)


### Name: fitDRC-package
### Title: Fitting Density Ratio Classes
### Aliases: fitDRC
### Keywords: Probability assessment probability elicitation expert
###   elicitation elicitation of vague knowledge subjective probabilities
###   imprecise probabilities decision theory robust Bayesian statistics
###   quantile elicitation Density Ratio Class

### ** Examples

################# Example 01 ################

# Demonstration of the construction of a very narrow Density Ratio Class
# for a case where the input quantiles correspond to the quantiles of the
# parametric distribution used for the lower and upper densities (in this
# case both are Normal distributions).

# Definition of quantiles:

p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- qnorm(p)

# Definition of parametric shapes of lower and upper densities (Normal):

dist.lower <- dist.normal.create(par=c(1,2))
dist.upper <- dist.normal.create(par=c(3,4))

# Parameter estimation (attention: runtime several minutes):

#res <- process.elidat(p = p,
#                      q = q,
#                      dist.lower,
#                      dist.upper,
#                      start.dist.lower.par = c("Mean"=2,"StDev"=3),
#                      start.dist.upper.par = c("Mean"=4,"StDev"=5))

# Extract density ratio class, print and plot results:

#drc01 <- res$drc
#print(drc01)
#plot(drc01)

################# Example 02 ################

# Demonstration of the construction of a Density Ratio Class using tans-
# formed beta distributions for lower and upper densities.

# Definition of quantiles:

p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- c(80, 145, 200, 240, 280)

# Definition of parametric shapes of lower and upper densities (transf. beta):

dist.beta  <- dist.beta.create(par=c(2.5,2.5))
trans.dil <- trans.dil.create(c(60, 305, 0, 1))

dist.lower <- dist.trans.create(dist.beta,trans.dil)
dist.upper <- dist.lower

# Parameter estimation (attention: runtime several minutes):

#res <- process.elidat(p = p,
#                      q = q,
#                      dist.lower,
#                      dist.upper,
#                      start.dist.lower.par =c("Shape1"=2.5,"Shape2"=2.5),
#                      start.dist.upper.par = c("Shape1"=2.5,"Shape2"=2.5))

# Extract density ratio class, print and plot results:

#drc02 <- res$drc
#print(drc02)
#plot(drc02)

# Note, due to the transformation, mean, standard deviation, median and mode
# cannot be calculated analytically (print(drc02 returns NA)). However, these
# characteristics can be calculated  numerically, using a sample from the
# distribution (demonstrated for the lower density):

# Mean:
#mean(CDFinv(drc02$dist.lower,runif(100000,0,1),drc02$dist.lower$par))

# Standard Deviation:
#sd(CDFinv(drc02$dist.lower,runif(100000,0,1),drc02$dist.lower$par))

# Median:
#CDFinv(drc02$dist.lower,0.5)

# Mode:
#samp <- runif(100000,0,1)
#ind.max <- which.max(PDF(drc02$dist.lower,
#                         CDFinv(drc02$dist.lower,samp,drc02$dist.lower$par),
#                         drc02$dist.lower$par))
#CDFinv(drc02$dist.lower,samp[ind.max],drc02$dist.lower$par)

################# Example 03 ################

# Demonstration of the construction of a Density Ratio Class using different
# parametric shapes for lower (Normal) and upper (Student t) distributions.

# Definition of quantiles:

p <- c(0.05, 0.25, 0.5, 0.75, 0.95, 0.05, 0.25, 0.5, 0.75, 0.95)
q <- log(c(1, 2, 4, 6, 10, 2, 3, 5, 9, 14))

# Definition of parametric shapes of lower and upper densities (Normal and
# Student t):

dist.lower <- dist.normal.create(par=c(1,1))
dist.upper <- dist.student.create(par=c(1,1,3))

# Parameter estimation (attention: runtime several minutes):

#res <- process.elidat(p = p,
#                      q = q,
#                      dist.lower,
#                      dist.upper,
#                      start.dist.lower.par = c("Mean"=1,"StDev"=1),
#                      start.dist.upper.par = c("Mean"=1,"StDev"=1))

# Extract density ratio class, print and plot results:

#drc03 <- res$drc
#print(drc03)
#plot(drc03,range=c(0.001,15))



