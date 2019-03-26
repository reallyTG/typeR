library(lmomco)


### Name: pdfrevgum
### Title: Probability Density Function of the Reverse Gumbel Distribution
### Aliases: pdfrevgum
### Keywords: distribution probability density function Distribution:
###   Gumbel (reversed)

### ** Examples

# See p. 553 of Hosking (1995)
# Data listed in Hosking (1995, table 29.3, p. 553)
D <- c(-2.982, -2.849, -2.546, -2.350, -1.983, -1.492, -1.443,
       -1.394, -1.386, -1.269, -1.195, -1.174, -0.854, -0.620,
       -0.576, -0.548, -0.247, -0.195, -0.056, -0.013,  0.006,
        0.033,  0.037,  0.046,  0.084,  0.221,  0.245,  0.296)
D <- c(D,rep(.2960001,40-28)) # 28 values, but Hosking mentions
                              # 40 values in total
z <-  pwmRC(D,threshold=.2960001)
str(z)
# Hosking reports B-type L-moments for this sample are
# lamB1 = -0.516 and lamB2 = 0.523
btypelmoms <- pwm2lmom(z$Bbetas)
# My version of R reports lamB1 = -0.5162 and lamB2 = 0.5218
str(btypelmoms)
rg.pars <- parrevgum(btypelmoms,z$zeta)
str(rg.pars)
# Hosking reports xi=0.1636 and alpha=0.9252 for the sample
# My version of R reports xi = 0.1635 and alpha = 0.9254
# Now one can continue one with a plotting example.
## Not run: 
##D F  <- nonexceeds()
##D PP <- pp(D) # plotting positions of the data
##D D  <- sort(D)
##D plot(D,PP)
##D lines(D,cdfrevgum(D,rg.pars))
##D # Now finally do the PDF
##D F <- seq(0.01,0.99,by=.01)
##D x <- quarevgum(F,rg.pars)
##D plot(x,pdfrevgum(x,rg.pars),type='l')
## End(Not run)



