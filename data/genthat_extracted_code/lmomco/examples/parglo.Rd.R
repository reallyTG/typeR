library(lmomco)


### Name: parglo
### Title: Estimate the Parameters of the Generalized Logistic Distribution
### Aliases: parglo
### Keywords: distribution (parameters) Distribution: Generalized Logistic
###   Distribution: Log-Logistic

### ** Examples

lmr <- lmoms(rnorm(20))
parglo(lmr)
## Not run: 
##D # A then Ph.D. student, L. Read inquired in February 2014 about the relation between
##D # GLO and the "Log-Logistic" distributions:
##D par.glo  <- vec2par(c(10, .56, 0), type="glo")         # Define GLO parameters
##D par.lnlo <- c(exp(par.glo$para[1]), 1/par.glo$para[2]) # Equivalent LN-LO parameters
##D F <- nonexceeds(); qF <- qnorm(F) # use a real probability axis to show features
##D plot(qF, exp(quaglo(F, par.glo)), type="l", lwd=5, xaxt="n", log="y",
##D      xlab="", ylab="QUANTILE") # notice the exp() wrapper on the GLO quantiles
##D lines(qF, par.lnlo[1]*(F/(1-F))^(1/par.lnlo[2]), col=2, lwd=2) # eq. for LN-LO
##D add.lmomco.axis(las=2, tcl=0.5, side.type="RI", otherside.type="NPP")
## End(Not run)



