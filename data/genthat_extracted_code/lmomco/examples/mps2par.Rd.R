library(lmomco)


### Name: mps2par
### Title: Use Maximum Product of Spacings to Estimate the Parameters of a
###   Distribution
### Aliases: mps2par
### Keywords: distribution (parameters) parameter (maximum product spacing
###   to) distribution (utility) maximum product spacing maximum product of
###   spacings parameter (estimation) goodness-of-fit Moran-Darling
###   statistic

### ** Examples

## Not run: 
##D pe3 <- vec2par(c(4.2, 0.2, 0.6), type="pe3") # Simulated values should have at least
##D X <- rlmomco(202, pe3); Xr  <- round(sort(X), digits=3) # one tie-run after rounding,
##D mps2par(X,  type="pe3")$para      # and the user can observe the (minor in this case)
##D mps2par(Xr, type="pe3")$para      # effect on parameters.
##D # Another note on MPS is needed. It is not reflection symmetric.
##D mps2par( X, type="pe3")$para
##D mps2par(-X, type="pe3")$para
## End(Not run)

## Not run: 
##D # Use 1,000 replications for sample size of 75 and estimate the bias and variance of
##D # the method of L-moments and maximum product spacing (MPS) for the 100-year event
##D # using the Pearson Type III distribution.
##D set.seed(1596)
##D nsim <- 1000; n <- 75; Tyear <- 100; type <- "pe3"
##D parent.lmr <- vec2lmom(c(5.5, 0.15, 0.03))   # L-moments of the "parent"
##D parent  <- lmom2par(parent.lmr, type="pe3")  # "the parent"
##D Q100tru <- qlmomco(T2prob(Tyear), parent)    # "true value"
##D Q100lmr <- Q100mps <- rep(NA, nsim)          # empty vectors
##D T3lmr <- T4lmr <- T3mps <- T4mps <- rep(NA, nsim)
##D for(i in 1:nsim) { # simulate from the parent, compute L-moments
##D    tmpX <- rlmomco(n, parent); lmrX <- lmoms(tmpX)
##D    if(! are.lmom.valid(lmrX)) { # quiet check on viability
##D      lmrX <- pwm2lmom(pwms.pp(tmpX)) # try a pwm by plotting positions instead
##D      if(! are.lmom.valid(lmrX)) next
##D    }
##D    lmrpar <- lmom2par(lmrX, type=type)                  # Method of L-moments
##D    mpspar <-  mps2par(tmpX, type=type, para.int=lmrpar) # Method of MPS
##D    if(! is.null(lmrpar)) {
##D       Q100lmr[i] <- qlmomco(T2prob(Tyear), lmrpar); lmrlmr <- par2lmom(lmrpar)
##D       T3lmr[i] <- lmrlmr$ratios[3]; T4lmr[i] <- lmrlmr$ratios[4]
##D    }
##D    if(! is.null(mpspar)) {
##D       Q100mps[i] <- qlmomco(T2prob(Tyear), mpspar); mpslmr <- par2lmom(mpspar)
##D       T3mps[i] <- mpslmr$ratios[3]; T4mps[i] <- mpslmr$ratios[4]
##D    }
##D }
##D print(summary(Q100tru - Q100lmr)) # Method of L-moment   (mean = -0.00176)
##D print(summary(Q100tru - Q100mps)) # Method of MPS        (mean = -0.02746)
##D print(var(Q100tru - Q100lmr, na.rm=TRUE)) # Method of L-moments (0.009053)
##D print(var(Q100tru - Q100mps, na.rm=TRUE)) # Method of MPS       (0.009880)
##D # CONCLUSION: MPS is very competitive to the mighty L-moments.
##D 
##D LMR <- data.frame(METHOD=rep("Method L-moments",        nsim), T3=T3lmr, T4=T4lmr)
##D MPS <- data.frame(METHOD=rep("Maximum Product Spacing", nsim), T3=T3mps, T4=T4mps)
##D ZZ <- merge(LMR, MPS, all=TRUE)
##D boxplot(ZZ$T3~ZZ$METHOD, data=ZZ); mtext("L-skew Distributions")
##D boxplot(ZZ$T4~ZZ$METHOD, data=ZZ); mtext("L-kurtosis Distributions") #
## End(Not run)

## Not run: 
##D # Data shown in Cheng and Stephens (1989). They have typesetting error on their
##D # "sigma." Results mu=34.072 and sigma=sqrt(6.874)=2.6218
##D H590 <- c(27.55, 31.82, 33.74, 34.15, 35.32, 36.78,
##D           29.89, 32.23, 33.74, 34.44, 35.44, 37.07,
##D           30.07, 32.28, 33.86, 34.62, 35.61, 37.36,
##D           30.65, 32.69, 33.86, 34.74, 35.61, 37.36,
##D           31.23, 32.98, 33.86, 34.74, 35.73, 37.36,
##D           31.53, 33.28, 34.15, 35.03, 35.90, 40.28,
##D           31.53, 33.28, 34.15, 35.03, 36.20) # breaking stress MPAx1E6 of carbon block.
##D mps2par(H590, type="nor", ties="rounding", delta=0.005)$para
##D mps2par(H590, type="nor", ties="rounding" )$para
##D mps2par(H590, type="nor", ties="bernstein")$para
##D #        mu     sigma
##D # 34.071424  2.622484 # using a slight variant on their eq. 4.1.
##D # 34.071424  2.622614 # using log10offset=3
##D # 34.088769  2.690781 # using Bernstein smooth and unaffecting middle of odd tie runs
##D # The MoranTest show rejection of the Normal distribution at alpha=0.05, with the
##D # "rounding" and "delta=0.005"" and T=63.8 compared to their result of T=63.1,
##D # which to be considered that the strategy here is not precisely the same as theirs.
## End(Not run)

## Not run: 
##D # Demonstration of parameter transformation and retransformation
##D set.seed(9209) # same seed used under mle2par() in parallel example
##D x <- rlmomco(500, vec2par(c(1,1,3), type="gam")) # 3-p Generalized Gamma
##D guess <- lmr2par(x, type="gam", p=3) # By providing a 3-p guess the 3-p
##D # Generalized Gamma will be triggered internally. There are problems passing
##D # "p" argument to optim() if that function is to pick up the ... argument.
##D mps2par(x, type="gam", para.int=guess, silent=FALSE,
##D            ptransf=  function(t) { c(log(t[1]), log(t[2]), t[3])},
##D            pretransf=function(t) { c(exp(t[1]), exp(t[2]), t[3])})$para
##D # Reports:       mu     sigma        nu   for some simulated data.
##D #         0.9997019 1.0135674 3.0259012 
## End(Not run)



