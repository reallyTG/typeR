library(WebPower)


### Name: wp.sem.rmsea
### Title: Statistical Power Analysis for Structural Equation Modeling
###   based on RMSEA
### Aliases: wp.sem.rmsea

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.sem.rmsea (n = 100, df = 4, rmsea0 = 0,
               rmsea1 = 0.116,  power = NULL, alpha = 0.05)
#    Power for SEM based on RMSEA
#  
#        n df rmsea0 rmsea1     power alpha
#      100  4      0  0.116 0.4208173  0.05
#  
#    URL: http://psychstat.org/rmsea

#To generate a power curve given a sequence of sample sizes:
res <- wp.sem.rmsea (n = seq(100,600,100), df = 4, rmsea0 = 0,
                        rmsea1 = 0.116,  power = NULL, alpha = 0.05)
res
#    Power for SEM based on RMSEA
#  
#        n df rmsea0 rmsea1     power alpha
#      100  4      0  0.116 0.4208173  0.05
#      200  4      0  0.116 0.7494932  0.05
#      300  4      0  0.116 0.9135968  0.05
#      400  4      0  0.116 0.9746240  0.05
#      500  4      0  0.116 0.9933963  0.05
#      600  4      0  0.116 0.9984373  0.05
#  
#    URL: http://psychstat.org/rmsea

#To plot the power curve:
plot(res) 

#To calculate the required sample size given power and effect size:
wp.sem.rmsea (n = NULL, df = 4, rmsea0 = 0,
              rmsea1 = 0.116,  power = 0.8, alpha = 0.05)
#    Power for SEM based on RMSEA
#  
#             n df rmsea0 rmsea1 power alpha
#      222.7465  4      0  0.116   0.8  0.05
#  
#    URL: http://psychstat.org/rmsea

#  #To calculate the minimum detectable effect size of rmsea1 given power and sample size:
wp.sem.rmsea (n = 100, df = 4, rmsea0 = 0,
             rmsea1 = NULL,  power = 0.8, alpha = 0.05)
#    Power for SEM based on RMSEA
#  
#        n df rmsea0    rmsea1 power alpha
#      100  4      0 0.1736082   0.8  0.05
#  
#    URL: http://psychstat.org/rmsea
## End(No test)




