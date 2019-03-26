library(WebPower)


### Name: wp.mc.sem.basic
### Title: Statistical Power Analysis for Structural Equation Modeling /
###   Mediation based on Monte Carlo Simulation
### Aliases: wp.mc.sem.basic

### ** Examples

## Not run: 
##D #To calculate power for mediation based on Monte Carlo simulation when Sobel test is used:
##D #To specify the model
##D demo ="
##D 		y ~ cp*x + start(0)*x + b*m + start(0.39)* m
##D 		m ~ a*x + start(0.39)*x
##D 		x ~~ start(1)*x
##D 		m ~~ start(1)*m
##D 		y ~~ start(1)*y
##D 	"
##D #To specify the indirect effects
##D mediation = "
##D 		ab := a*b
##D 		abc:= a*b + cp
##D " 
##D #To calculate power for mediation using regular standard errors
##D sobel.regular = wp.mc.sem.basic(model=demo, indirect=mediation, nobs=100, nrep=1000,
##D        parallel="snow", skewness=c(0, 0, 1.3), kurtosis=c(0,0,10), ovnames=c("x","m","y"))
##D 
##D #To calculate power for mediation using robust standard errors
##D sobel.robust = wp.mc.sem.basic(model=demo, indirect=mediation, nobs=100, nrep=1000,
##D    parallel="snow", skewness=c(0, 0, 1.3), kurtosis=c(0,0,10), ovnames=c("x","m","y"), se="robust")
##D 
##D #To print the power for mediation based on Sobel test using regular standard errors:
##D summary(sobel.regular)
##D #    Basic information:
##D #    
##D #      Esimation method                                  ML
##D #      Standard error                              standard
##D #      Number of requested replications                1000
##D #      Number of successful replications               1000
##D #    
##D #                           True  Estimate      MSE      SD     Power Coverage
##D #    Regressions:
##D #      y ~
##D #        x        (cp)      0.000    0.003    0.106    0.107    0.045    0.955
##D #        m         (b)      0.390    0.387    0.099    0.113    0.965    0.919
##D #      m ~
##D #        x         (a)      0.390    0.389    0.100    0.101    0.976    0.953
##D #    Variances:
##D #        x                  1.000    0.995    0.141    0.139    1.000    0.936
##D #        m                  1.000    0.981    0.139    0.137    1.000    0.923
##D #        y                  1.000    0.968    0.137    0.330    1.000    0.560
##D #    
##D #    Indirect/Mediation effects:
##D #        ab                 0.152    0.150    0.056    0.060    0.886    0.928
##D #        abc                0.152    0.153    0.106    0.109    0.305    0.948
##D 
##D #To print the power analysis results for mediation based on Sobel test using robust standard errors:
##D summary(sobel.robust)
##D #    Basic information:
##D #    
##D #      Esimation method                                  ML
##D #      Standard error                            robust.sem
##D #      Number of requested replications                1000
##D #      Number of successful replications               1000
##D #    
##D #                           True  Estimate      MSE      SD     Power Coverage
##D #    Regressions:
##D #      y ~
##D #        x        (cp)      0.000   -0.003    0.106    0.113    0.055    0.945
##D #        m         (b)      0.390    0.398    0.111    0.119    0.972    0.927
##D #      m ~
##D #        x         (a)      0.390    0.389    0.099    0.101    0.974    0.939
##D #    
##D #    Intercepts:
##D #        y                  0.000    0.000    0.100    0.104    0.058    0.942
##D #        m                  0.000    0.000    0.100    0.105    0.054    0.946
##D #        x                  0.000   -0.004    0.100    0.104    0.066    0.934
##D #    
##D #    Variances:
##D #        x                  1.000    0.991    0.138    0.140    1.000    0.930
##D #        m                  1.000    0.976    0.135    0.135    1.000    0.915
##D #        y                  1.000    1.002    0.281    0.365    0.981    0.805
##D #    
##D #    Indirect/Mediation effects:
##D #        ab                 0.152    0.156    0.060    0.064    0.870    0.900
##D #        abc                0.152    0.153    0.108    0.117    0.303    0.936
## End(Not run)




