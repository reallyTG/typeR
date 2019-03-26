library(Rgbp)


### Name: plot.gbp
### Title: Drawing Shrinkage and Posterior Interval Plots
### Aliases: plot.gbp
### Keywords: methods

### ** Examples


  data(hospital)

  z <- hospital$d
  n <- hospital$n
  y <- hospital$y
  se <- hospital$se
  
  
  ###################################################################################
  # We do not have any covariates and do not know a mean of the prior distribution. #
  ###################################################################################

    ###############################################################
    # Gaussian Regression Interactive Multilevel Modeling (GRIMM) #
    ###############################################################

    g <- gbp(y, se, model = "gaussian")
    plot(g)
    plot(g, sort = FALSE)

    ###############################################################
    # Binomial Regression Interactive Multilevel Modeling (BRIMM) #
    ###############################################################

    b <- gbp(z, n, model = "binomial")
    plot(b)
    plot(b, sort = FALSE)

    ##############################################################
    # Poisson Regression Interactive Multilevel Modeling (PRIMM) #
    ##############################################################

    p <- gbp(z, n, mean.PriorDist = 0.03, model = "poisson")
    plot(p)
    plot(p, sort = FALSE)




