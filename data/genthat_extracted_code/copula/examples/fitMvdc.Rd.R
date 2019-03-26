library(copula)


### Name: fitMvdc
### Title: Estimation of Multivariate Models Defined via Copulas
### Aliases: fitMvdc coef.fittedMV logLik.fittedMV vcov.fittedMV loglikMvdc
### Keywords: models multivariate

### ** Examples

G3 <- gumbelCopula(3, dim=2)
gMvd2  <- mvdc(G3, c("exp","exp"),
               param = list(list(rate=2), list(rate=4)))
## with identical margins:
gMvd.I <- mvdc(G3, "exp",
               param = list(rate=3), marginsIdentical=TRUE)

(Xtras <- copula:::doExtras()) # determine whether examples will be extra (long)
n <- if(Xtras) 10000 else 200 # sample size (realistic vs short for example)

set.seed(11)
x <- rMvdc(n, gMvd2)
## Default:     hideWarnings = FALSE .. i.e. show warnings here
fit2 <- fitMvdc(x, gMvd2, start = c(1,1, 2))
fit2
confint(fit2)
summary(fit2) # slightly more
## The estimated, asymptotic var-cov matrix [was used for confint()]:
vcov(fit2)

## with even more output for the "identical margin" case:
fitI <- fitMvdc(x, gMvd.I, start = c(3, 2),
                optim.control=list(trace= TRUE, REPORT= 2))
summary(fitI)
coef(fitI, SE = TRUE)
stopifnot(is.matrix(coef(fitI, SE = TRUE)),
          is.matrix(print( confint(fitI) )) )

## a wrong starting value can already be *the* problem:
f2 <- try(fitMvdc(x, gMvd.I, start = c(1, 1),
           optim.control=list(trace= TRUE, REPORT= 2)))
##--> Error in optim( ... ) : non-finite finite-difference value [2]

##==> "Solution" :  Using a more robust (but slower) optim() method:
fI.2 <- fitMvdc(x, gMvd.I, start = c(1, 1), method = "Nelder",
                optim.control=list(trace= TRUE))
fI.2
## Don't show: 
 stopifnot(all.equal(coef(fitI, SE = TRUE),
		     coef(fI.2, SE = TRUE),  tolerance = 2e-4),
	   all.equal(coef(fitI), coef(fI.2), tolerance = 1e-4))
## End(Don't show)




