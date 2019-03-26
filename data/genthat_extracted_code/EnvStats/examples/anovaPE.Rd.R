library(EnvStats)


### Name: anovaPE
### Title: Compute Lack-of-Fit and Pure Error Anova Table for a Linear
###   Model
### Aliases: anovaPE
### Keywords: models regression

### ** Examples

  # The data frame EPA.97.cadmium.111.df contains calibration data for 
  # cadmium at mass 111 (ng/L) that appeared in Gibbons et al. (1997b) 
  # and were provided to them by the U.S. EPA. 
  #
  # First, display a plot of these data along with the fitted calibration line 
  # and 99% non-simultaneous prediction limits.  See  
  # Millard and Neerchal (2001, pp.566-569) for more details on this 
  # example.

  EPA.97.cadmium.111.df
  #   Cadmium Spike
  #1     0.88     0
  #2     1.57     0
  #3     0.70     0
  #...
  #33   99.20   100
  #34   93.71   100
  #35  100.43   100

  Cadmium <- EPA.97.cadmium.111.df$Cadmium 

  Spike <- EPA.97.cadmium.111.df$Spike 

  calibrate.list <- calibrate(Cadmium ~ Spike, 
    data = EPA.97.cadmium.111.df) 

  newdata <- data.frame(Spike = seq(min(Spike), max(Spike), length.out = 100)) 

  pred.list <- predict(calibrate.list, newdata = newdata, se.fit = TRUE) 

  pointwise.list <- pointwise(pred.list, coverage = 0.99, individual = TRUE) 

  plot(Spike, Cadmium, ylim = c(min(pointwise.list$lower), 
    max(pointwise.list$upper)), xlab = "True Concentration (ng/L)", 
    ylab = "Observed Concentration (ng/L)") 

  abline(calibrate.list, lwd = 2) 

  lines(newdata$Spike, pointwise.list$lower, lty = 8, lwd = 2) 

  lines(newdata$Spike, pointwise.list$upper, lty = 8, lwd = 2) 

  title(paste("Calibration Line and 99% Prediction Limits", 
    "for US EPA Cadmium 111 Data", sep="\n"))

  rm(Cadmium, Spike, newdata, calibrate.list, pred.list, 
    pointwise.list)

  #----------

  # Now fit the linear model and produce the anova table to check for 
  # lack of fit.  There is no evidence for lack of fit (p = 0.41).

  fit <- lm(Cadmium ~ Spike, data = EPA.97.cadmium.111.df) 


  anova(fit) 
  #Analysis of Variance Table
  #
  #Response: Cadmium
  #          Df Sum Sq Mean Sq F value    Pr(>F)    
  #Spike      1  43220   43220  9356.9 < 2.2e-16 ***
  #Residuals 33    152       5                      
  #---
  #Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
  #Analysis of Variance Table
  #
  #Response: Cadmium 
  #
  #Terms added sequentially (first to last) 
  #          Df Sum of Sq  Mean Sq  F Value Pr(F) 
  #    Spike  1  43220.27 43220.27 9356.879     0 
  #Residuals 33    152.43     4.62 


  anovaPE(fit) 
  #                 Df Sum Sq Mean Sq  F value Pr(>F)    
  #Spike             1  43220   43220 9341.559 <2e-16 ***
  #Lack of Fit       3     14       5    0.982 0.4144    
  #Pure Error       30    139       5                    
  #---
  #Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 


  rm(fit)



