library(lmomco)


### Name: mle2par
### Title: Use Maximum Likelihood to Estimate Parameters of a Distribution
### Aliases: mle2par
### Keywords: distribution (parameters) parameter (maximum likelihood to)
###   distribution (utility) parameter (estimation)

### ** Examples

## Not run: 
##D # This example might fail on mle2par() or mps2par() depending on the values
##D # that stem from the simulation. Trapping for a NULL return is not made here.
##D father <- vec2par(c(37,25,114), type="st3"); FF <- nonexceeds(); qFF <- qnorm(FF)
##D X <- rlmomco(78, father) # rerun if MLE and MPS fail to get a solution
##D plot(qFF,  qlmomco(FF, father), type="l", xlim=c(-3,3),
##D      xlab="STANDARD NORMAL VARIATE", ylab="QUANTILE") # parent (black)
##D lines(qFF, qlmomco(FF, lmom2par(lmoms(X), type="gev")), col=2) # L-moments (red)
##D lines(qFF, qlmomco(FF, mps2par(X, type="gev")), col=3)         #     MPS (green)
##D lines(qFF, qlmomco(FF, mle2par(X, type="gev")), col=4)         #     MLE  (blue)
##D points(qnorm(pp(X)), sort(X)) # the simulated data
## End(Not run)

## Not run: 
##D # REFLECTION SYMMETRY
##D set.seed(451)
##D X <- rlmomco(78, vec2par(c(2.12, 0.5, 0.6), type="pe3"))
##D # MLE and MPS are almost reflection symmetric, but L-moments always are.
##D mle2par( X, type="pe3")$para #  2.1796827 0.4858027  0.7062808
##D mle2par(-X, type="pe3")$para # -2.1796656 0.4857890 -0.7063917
##D mps2par( X, type="pe3")$para #  2.1867551 0.5135882  0.6975195
##D mps2par(-X, type="pe3")$para # -2.1868252 0.5137325 -0.6978034
##D parpe3(lmoms( X))$para       #  2.1796630 0.4845216  0.7928016
##D parpe3(lmoms(-X))$para       # -2.1796630 0.4845216 -0.7928016
## End(Not run)

## Not run: 
##D Ks <- seq(-1,+1,by=0.02); n <- 100; MLE <- MPS <- rep(NA, length(Ks))
##D for(i in 1:length(Ks)) {
##D   sdat   <- rlmomco(n, vec2par(c(1,0.2,Ks[i]), type="pe3"))
##D   mle    <- mle2par(sdat, type="pe3")$para[3]
##D   mps    <- mps2par(sdat, type="pe3")$para[3]
##D   MLE[i] <- ifelse(is.null(mle), NA, mle) # A couple of failures expected as NA's.
##D   MPS[i] <- ifelse(is.null(mps), NA, mps) # Some amount fewer failures than MLE.
##D }
##D plot( MLE, MPS, xlab="SKEWNESS BY MLE", ylab="SKEWNESS BY MPS")#
## End(Not run)

## Not run: 
##D # Demonstration of parameter transformation and retransformation
##D set.seed(9209) # same seed used under mps2par() in parallel example
##D x <- rlmomco(500, vec2par(c(1,1,3), type="gam")) # 3-p Generalized Gamma
##D guess <- lmr2par(x, type="gam", p=3) # By providing a 3-p guess the 3-p
##D # Generalized Gamma will be triggered internally. There are problems passing
##D # "p" argument to optim() if that function is to pick up the ... argument.
##D mle2par(x, type="gam", para.int=guess, silent=FALSE,
##D            ptransf=  function(t) { c(log(t[1]), log(t[2]), t[3])},
##D            pretransf=function(t) { c(exp(t[1]), exp(t[2]), t[3])})$para
##D # Reports:       mu     sigma        nu   for some simulated data.
##D #         1.0341269 0.9731455 3.2727218 
## End(Not run)

## Not run: 
##D # Demonstration of parameter estimation with tails of density zero, which
##D # are intercepted internally to maintain finiteness. We explore the height
##D # distribution for male cats of the cats dataset from the MASS package and
##D # fit the generalized lambda. The log-likelihood is shown by silent=FALSE
##D # to see that the algorithm converges slowly. and shows how we can control
##D # the relative tolerance of the optim() function as shown below and
##D # investigate the convergence by reviewing the five fits to the data.
##D FF <- nonexceeds(sig6=TRUE)
##D library(MASS); data(cats); x <- cats$Hwt[cats$Sex == "M"]
##D p2 <- mle2par(x, type="gld", silent=FALSE, control=list(reltol=1E-2))
##D p3 <- mle2par(x, type="gld", silent=FALSE, control=list(reltol=1E-3))
##D p4 <- mle2par(x, type="gld", silent=FALSE, control=list(reltol=1E-4))
##D p5 <- mle2par(x, type="gld", silent=FALSE, control=list(reltol=1E-5))
##D p6 <- mle2par(x, type="gld", silent=FALSE, control=list(reltol=1E-6))
##D plot( FF, quagld(FF, p2), type="l", col=1); points(pp(x), sort(x))
##D lines(FF, quagld(FF, p3), col=2); lines(FF, par2qua(FF, p4), col=3)
##D lines(FF, quagld(FF, p5), col=4); lines(FF, par2qua(FF, p6), col=6) #
## End(Not run)



