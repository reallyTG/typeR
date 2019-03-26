library(lmomco)


### Name: lmoms.bootbarvar
### Title: The Exact Bootstrap Mean and Variance of L-moments
### Aliases: lmoms.bootbarvar
### Keywords: L-moment (sample) L-moment (variation)

### ** Examples

## Not run: 
##D    para <- vec2par(c(0,1), type="gum") # Parameters of Gumbel
##D    n <- 10; nmom <- 6; nsim <- 2000
##D    # X <- rlmomco(n, para) # This is commented out because
##D    # the sample below is from the Gumbel distribution as in para.
##D    # However, the seed for the random number generator was not recorded.
##D    X <- c( -1.4572506, -0.7864515, -0.5226538,  0.1756959,  0.2424514,
##D             0.5302202,  0.5741403,  0.7708819,  1.9804254,  2.1535666)
##D    EXACT.BOOTLMR <- lmoms.bootbarvar(X, nmom=nmom)
##D    LA <- EXACT.BOOTLMR$lambdavars
##D    LB <- LC <- rep(NA, length(LA))
##D    set.seed(n)
##D    for(i in 1:length(LB)) {
##D      LB[i] <- var(replicate(nsim,
##D                   lmoms(sample(X, n, replace=TRUE), nmom=nmom)$lambdas[i]))
##D    }
##D    set.seed(n)
##D    for(i in 1:length(LC)) {
##D      LC[i] <- var(replicate(nsim,
##D                   lmoms(rlmomco(n, para), nmom=nmom)$lambdas[i]))
##D    }
##D    print(LA) # The exact bootstrap variances of the L-moments.
##D    print(LB) # Bootstrap variances of the L-moments by actual resampling.
##D    print(LC) # Simulation of the variances from the parent distribution.
##D 
##D    # The variances for this example are as follows:
##D    #> print(LA)
##D    #[1] 0.115295563 0.018541395 0.007922893 0.010726508 0.016459913 0.029079202
##D    #> print(LB)
##D    #[1] 0.117719198 0.018945827 0.007414461 0.010218291 0.016290100 0.028338396
##D    #> print(LC)
##D    #[1] 0.17348653 0.04113861 0.02156847 0.01443939 0.01723750 0.02512031
##D    # The variances, when using simulation of parent distribution,
##D    # appear to be generally larger than those based only on resampling
##D    # of the available sample of only 10 values.
##D 
##D    # Interested users may inspect the exact bootstrap estimates of the
##D    # order statistics and the variance-covariance matrix.
##D    # print(EXACT.BOOTLMR$bootstrap.orderstatistics)
##D    # print(EXACT.BOOTLMR$varcovar.orderstatistics)
##D 
##D    # The output for these two print functions is not shown, but what follows
##D    # are the numerical confirmations from A.D. Hutson (personnal commun., 2012)
##D    # using his personnal algorithms (outside of R).
##D    # Date: Jul 2012, From: ahutson, To: Asquith
##D    # expected values the same
##D    # -1.174615143125091, -0.7537760316881618, -0.3595651823632459,
##D    # -0.028951905838698,  0.2360931764028858,  0.4614289985084462,
##D    #  0.713957210869635,  1.0724040932920058,  1.5368435379648948,
##D    #  1.957207045977329
##D    # and the first two values on the first row of the matrix are
##D    # 0.1755400544274771,  0.1306634198810892
## End(Not run)
## Not run: 
##D # Wang and Hutson (2013): Attempt to reproduce first entry of
##D # row 9 (n=35) in Table 1 of the reference, which is 0.878.
##D Xsq  <- qchisq(1-0.05, 2); n <- 35; nmom <- 4; nsim <- 1000
##D para <- vec2par(c(0,1), type="gum") # Parameters of Gumbel
##D eta  <- as.vector(lmorph(par2lmom(para))$ratios[3:4])
##D h <- 0
##D for(i in 1:nsim) {
##D    X <- rlmomco(n,para); message(i)
##D    EB <- lmoms.bootbarvar(X, nmom=nmom, verbose=FALSE)
##D    lmr    <- lmoms(X); etahat <- as.vector(lmr$ratios[c(3,4)])
##D    Pinv   <- EB$inverse.varcovar.tau34
##D    deta   <- (eta - etahat)
##D    LHS <- t(deta) ##D 
##D    if(LHS > Xsq) { # Comparison to Chi-squared distribution
##D       h <- h + 1 # increment because outside ellipse
##D       message("Outside: ",i, " ", h, " ", round(h/i, digits=3))
##D    }
##D }
##D message("Empirical Coverage Probability with Alpha=0.05 is ",
##D         round(1 - h/nsim, digits=3), " and count is", h)
##D # I have run this loop and recorded an h=123 for the above settings. I compute a
##D # coverage probability of 0.877, which agrees with Wang and Hutson (2013) within 0.001.
##D # Hence "very down the line" computations of lmoms.bootbarvar appear to be verified.
## End(Not run)



