library(Rgbp)


### Name: coverage
### Title: Estimating Coverage Probability
### Aliases: coverage
### Keywords: methods

### ** Examples


  # Loading datasets
  data(schools)
  y <- schools$y
  se <- schools$se

  # Arbitrary covariate for schools data
  x2 <- rep(c(-1, 0, 1, 2), 2)

  # baseball data where z is Hits and n is AtBats
  z <- c(18, 17, 16, 15, 14, 14, 13, 12, 11, 11, 10, 10, 10, 10, 10,  9,  8,  7)
  n <- c(45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45, 45)

  # One covariate: 1 if a player is an outfielder and 0 otherwise
  x1 <- c(1,  1,  1,  1,  1,  0,  0,  0,  0,  1,  0,  0,  0,  1,  1,  0,  0,  0)
  
  #################################################################
  # Gaussian Regression Interactive Multi-level Modeling (GRIMM) #
  #################################################################

    ####################################################################################
    # If we do not have any covariate and do not know a mean of the prior distribution #
    ####################################################################################

    g <- gbp(y, se, model = "gaussian")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    gcv <- coverage(g, nsim = 10)  

    ### gcv$coverageRB, gcv$coverageS, gcv$average.coverageRB, gcv$average.coverageS,
    ### gcv$minimum.coverageRB, gcv$raw.resultRB, gcv$raw.resultS

    ### gcv <- coverage(g, mean.PriorDist = 3, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 150, nsim = 100)
    ### gcv <- coverage(g, reg.coef = 10, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 150, mean.PriorDist = 3, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 150, reg.coef = 10, nsim = 100)

    ##################################################################################
    # If we have one covariate and do not know a mean of the prior distribution yet, #
    ##################################################################################

    g <- gbp(y, se, x2, model = "gaussian")
 
    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    gcv <- coverage(g, nsim = 10)  
 
    ### gcv$coverageRB, gcv$coverageS, gcv$average.coverageRB, gcv$average.coverageS,
    ### gcv$minimum.coverageRB, gcv$raw.resultRB, gcv$raw.resultS

    ### gcv <- coverage(g, mean.PriorDist = 3, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 200, nsim = 100)
    ### gcv <- coverage(g, reg.coef = c(10, 2), nsim = 100)
    ### gcv <- coverage(g, A.or.r = 200, mean.PriorDist = 3, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 200, reg.coef = c(10, 2), nsim = 100)

    ################################################
    # If we know a mean of the prior distribution, #
    ################################################

    g <- gbp(y, se, mean.PriorDist = 8, model = "gaussian")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    gcv <- coverage(g, nsim = 10)  

    ### gcv$coverageRB, gcv$coverageS, gcv$average.coverageRB, gcv$average.coverageS,
    ### gcv$minimum.coverageRB, gcv$raw.resultRB, gcv$raw.resultS

    ### gcv <- coverage(g, mean.PriorDist = 3, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 150, nsim = 100)
    ### gcv <- coverage(g, A.or.r = 150, mean.PriorDist = 3, nsim = 100)

  ################################################################
  # Binomial Regression Interactive Multi-level Modeling (BRIMM) #
  ################################################################

    ####################################################################################
    # If we do not have any covariate and do not know a mean of the prior distribution #
    ####################################################################################

    b <- gbp(z, n, model = "binomial")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    bcv <- coverage(b, nsim = 10)  

    ### bcv$coverageRB, bcv$coverageS, bcv$average.coverageRB, bcv$average.coverageS,
    ### bcv$minimum.coverageRB, bcv$raw.resultRB, bcv$raw.resultS

    ### bcv <- coverage(b, mean.PriorDist = 0.2, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 50, nsim = 100)
    ### bcv <- coverage(b, reg.coef = -1.5, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 50, mean.PriorDist = 0.2, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 50, reg.coef = -1.5, nsim = 100)

    ##################################################################################
    # If we have one covariate and do not know a mean of the prior distribution yet, #
    ##################################################################################

    b <- gbp(z, n, x1, model = "binomial")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    bcv <- coverage(b, nsim = 10)  

    ### bcv$coverageRB, bcv$coverageS, bcv$average.coverageRB, bcv$average.coverageS,
    ### bcv$minimum.coverageRB, bcv$raw.resultRB, bcv$raw.resultS

    ### bcv <- coverage(b, mean.PriorDist = 0.2, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 50, nsim = 100)
    ### bcv <- coverage(b, reg.coef = c(-1.5, 0), nsim = 100)
    ### bcv <- coverage(b, A.or.r = 40, mean.PriorDist = 0.2, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 40, reg.coef = c(-1.5, 0), nsim = 100)

    ################################################
    # If we know a mean of the prior distribution, #
    ################################################

    b <- gbp(z, n, mean.PriorDist = 0.265, model = "binomial")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    bcv <- coverage(b, nsim = 10)  

    ### bcv$coverageRB, bcv$coverageS, bcv$average.coverageRB, bcv$average.coverageS,
    ### bcv$minimum.coverageRB, bcv$raw.resultRB, bcv$raw.resultS

    ### bcv <- coverage(b, mean.PriorDist = 0.2, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 50, nsim = 100)
    ### bcv <- coverage(b, A.or.r = 40, mean.PriorDist = 0.2, nsim = 100)

  ###############################################################
  # Poisson Regression Interactive Multi-level Modeling (PRIMM) #
  ###############################################################

    ################################################
    # If we know a mean of the prior distribution, #
    ################################################

    p <- gbp(z, n, mean.PriorDist = 0.265, model = "poisson")

    ### when we want to simulate pseudo datasets considering the estimated values 
    ### as true ones.
    pcv <- coverage(p, nsim = 10)  

    ### pcv$coverageRB, pcv$coverageS, pcv$average.coverageRB, pcv$average.coverageS,
    ### pcv$minimum.coverageRB, pcv$raw.resultRB, pcv$raw.resultS

    ### pcv <- coverage(p, mean.PriorDist = 0.265, nsim = 100)
    ### pcv <- coverage(p, A.or.r = 150, nsim = 100)
    ### pcv <- coverage(p, A.or.r = 150, mean.PriorDist = 0.265, nsim = 100)




