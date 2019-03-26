library(VGAMextra)


### Name: gammaRMean
### Title: 2-parameter Gamma Distribution
### Aliases: gammaRMean

### ** Examples

 
  ### Modelling the mean in terms of x2, two responses.
  
    set.seed(2017022101)
    nn <- 80
    x2 <- runif(nn)
    mu <- exp(1 + 0.5 * x2)
  
  # Shape and rate parameters in terms of 'mu'
    rate <- rep(exp(1), nn)
    shape <- gammaRMeanlink(theta = mu, rate = rate,
                            inverse = TRUE, deriv = 0)
  
  # Generate some random data
    y1 <- rgamma(n = nn, shape = shape, rate =  rate)
    gdata <- data.frame(x2 = x2, y1 = y1)
    rm(y1)

  # lmu = "gammaRMeanlink" replaces lshape, whilst lrate = "loge"
    fit1 <- vglm(cbind(y1, y1) ~ x2,
                 gammaRMean(lmu = "gammaRMeanlink", lss = FALSE, zero = "rate"),
                 data = gdata, trace = TRUE, crit = "log")
     coef(fit1, matrix = TRUE)
     summary(fit1)
    
  # Compare fitted values with true values.
    compare1 <- cbind(fitted.values(fit1)[, 1, drop = FALSE], mu)
    colnames(compare1) <- c("Fitted.vM1", "mu")
    head(compare1)
 
  
  ### Mimicking gammaR. Notice lmu = NULL.
    fit2 <- vglm(y1 ~ x2, gammaRMean(lmu = NULL, lshape = "loge",
                                     lrate = "loge", lss = FALSE, zero = "rate"),
                 data = gdata, trace = TRUE, crit = "log")
 
  # Compare fitted values with true values.
    compare2 <- with(gdata, cbind(fitted.values(fit2), y1, mu))
    colnames(compare2) <- c("Fitted.vM2", "y", "mu")
    head(compare2)
 
    
  ### Fitted values -- Model1 vs Fitted values -- Model2
    fit1vsfit2 <- cbind(fitted.values(fit1)[, 1, drop = FALSE], 
                        fitted.values(fit2))
    colnames(fit1vsfit2) <- c("Fitted.vM1", "Fitted.vM2")
    head(fit1vsfit2)




