library(fitdistrplus)


### Name: logLikplot
### Title: (Log)likelihood plot for a fit using maximum likelihood
### Aliases: llplot
### Keywords: distribution

### ** Examples

# (1) a distribution with one parameter
#

x <- rexp(50)
fite <- fitdist(x, "exp")
llplot(fite)
llplot(fite, col = "red", fit.show = TRUE)
llplot(fite, col = "red", fit.show = TRUE, loglik = FALSE)


# (2) a distribution with two parameters
# 

data(groundbeef)
serving <- groundbeef$serving
fitg <- fitdist(serving, "gamma")
llplot(fitg)
## Not run: 
##D llplot(fitg, expansion = 2)
##D llplot(fitg, pal.col = heat.colors(100), fit.show = TRUE)
##D llplot(fitg, back.col = FALSE, nlev = 25, fit.show = TRUE)
## End(Not run)

# (3) a distribution with two parameters with one fixed
# 
fitg2 <- fitdist(serving, "gamma", fix.arg = list(rate = 0.5))
llplot(fitg2, fit.show = TRUE)

# (4) a distribution with three parameters
# 

## Not run: 
##D   data(endosulfan)
##D   ATV <-endosulfan$ATV
##D   library("actuar")
##D   fBurr <- fitdist(ATV, "burr", start = list(shape1 = 0.3, shape2 = 1, rate = 1))
##D   llplot(fBurr)
##D   llplot(fBurr, back.col = FALSE, fit.show = TRUE, fit.pch = 16)
##D   llplot(fBurr, nlev = 0, pal.col = rainbow(100), lseq = 100)
## End(Not run)

# (5) a distribution with two parameters fitted on censored data
# 
data(salinity)
fsal <- fitdistcens(salinity, "lnorm")
llplot(fsal, fit.show = TRUE)
llplot(fsal, fit.show = TRUE, loglik = FALSE)





