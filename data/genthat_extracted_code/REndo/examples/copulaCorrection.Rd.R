library(REndo)


### Name: copulaCorrection
### Title: Fitting Linear Models Endogenous Regressors using Gaussian
###   Copula
### Aliases: copulaCorrection

### ** Examples

data("dataCopCont")
data("dataCopCont2")
data("dataCopDis")
data("dataCopDis2")
data("dataCopDisCont")

## No test: 
## Not run: 
##D # Single continuous: log-likelihood optimization
##D c1 <- copulaCorrection(y~X1+X2+P|continuous(P), data=dataCopCont)
##D # same as above, with start.parameters and number of bootstrappings
##D c1 <- copulaCorrection(y~X1+X2+P|continuous(P), num.boots=500, data=dataCopCont,
##D                        start.params = c("(Intercept)"=1, X1=1, X2=-2, P=-1))
## End(Not run)## End(No test)

# All following examples fit linear model with Gaussian copulas

# 2 continuous endogenous regressors
c2 <- copulaCorrection(y~X1+X2+P1+P2|continuous(P1, P2),
                       data=dataCopCont2)
# same as above
c2 <- copulaCorrection(y~X1+X2+P1+P2|continuous(P1)+continuous(P2),
                       data=dataCopCont2)

# single discrete endogenous regressor
d1 <- copulaCorrection(y~X1+X2+P|discrete(P), data=dataCopDis)
# two discrete endogenous regressor
d2 <- copulaCorrection(y~X1+X2+P1+P2|discrete(P1)+discrete(P2),
                       data=dataCopDis2)
# same as above
d2 <- copulaCorrection(y~X1+X2+P1+P2|discrete(P1, P2),
                       data=dataCopDis2)

# the discrete only cases have a dedicated confint function
d2.ci <- confint(d2, num.simulations = 100)

# single discrete, single continuous
cd <- copulaCorrection(y~X1+X2+P1+P2|discrete(P1)+continuous(P2),
                       data=dataCopDisCont)

## No test: 
## Not run: 
##D # For single continuous only: use own optimization settings (see optimx())
##D # set maximum number of iterations to 50'000
##D res.c1 <- copulaCorrection(y~X1+X2+P|continuous(P),
##D                            optimx.args = list(itnmax = 50000),
##D                            data=dataCopCont)
##D 
##D # print detailed tracing information on progress
##D  res.c1 <- copulaCorrection(y~X1+X2+P|continuous(P),
##D                             optimx.args = list(control = list(trace = 6)),
##D                             data=dataCopCont)
##D 
##D # use method L-BFGS-B instead of Nelder-Mead and print report every 50 iterations
##D  res.c1 <- copulaCorrection(y~X1+X2+P|continuous(P),
##D                             optimx.args = list(method = "L-BFGS-B",
##D                                                control=list(trace = 2, REPORT=50)),
##D                             data=dataCopCont)
##D 
##D # for single cont case only:
##D # read out all coefficients, incl auxiliary coefs
##D c1.all.coefs <- coef(res.c1)
##D # same as above
##D c1.all.coefs <- coef(res.c1, complete = TRUE)
##D # only main model coefs
##D c1.main.coefs <- coef(res.c1, complete = FALSE)
##D 
## End(Not run)## End(No test)




