library(WebPower)


### Name: wp.sem.chisq
### Title: Statistical Power Analysis for Structural Equation Modeling
###   based on Chi-Squared Test
### Aliases: wp.sem.chisq

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.sem.chisq(n = 100, df = 4, effect = 0.054, power = NULL, alpha = 0.05)
#    Power for SEM (Satorra & Saris, 1985)
#  
#        n df effect     power alpha
#      100  4  0.054 0.4221152  0.05
#  
#    URL: http://psychstat.org/semchisq

#To generate a power curve given a sequence of sample sizes:
res <- wp.sem.chisq(n = seq(100,600,100), df = 4,
           effect = 0.054, power = NULL, alpha = 0.05)
res
#    Power for SEM (Satorra & Saris, 1985)
#  
#        n df effect     power alpha
#      100  4  0.054 0.4221152  0.05
#      200  4  0.054 0.7510630  0.05
#      300  4  0.054 0.9145660  0.05
#      400  4  0.054 0.9750481  0.05
#      500  4  0.054 0.9935453  0.05
#      600  4  0.054 0.9984820  0.05
#  
#    URL: http://psychstat.org/semchisq

#To plot the power curve:
plot(res) 

#To generate a power curve given a sequence of alphas:
res <- wp.sem.chisq(n = 100, df = 4, effect = 0.054, power = NULL,
                            alpha = c(0.001, 0.005, 0.01, 0.025, 0.05))
res
#    Power for SEM (Satorra & Saris, 1985)
#  
#        n df effect      power alpha
#      100  4  0.054 0.06539478 0.001
#      100  4  0.054 0.14952768 0.005
#      100  4  0.054 0.20867087 0.010
#      100  4  0.054 0.31584011 0.025
#      100  4  0.054 0.42211515 0.050
#  
#    URL: http://psychstat.org/semchisq

#To calculate the required sample size given power and effect size:
wp.sem.chisq(n = NULL, df = 4, effect = 0.054, power = 0.8, alpha = 0.05)
#  Power for SEM (Satorra & Saris, 1985)
#
#           n df effect power alpha
#    222.0238  4  0.054   0.8  0.05
#
#  URL: http://psychstat.org/semchisq

#To calculate the minimum detectable effect size of one coefficent given power and sample size:
wp.sem.chisq(n = 100, df = 4, effect = NULL, power = 0.8, alpha = 0.05)
#    Power for SEM (Satorra & Saris, 1985)
#  
#        n df    effect power alpha
#      100  4 0.1205597   0.8  0.05
#  
#    URL: http://psychstat.org/semchisq
## End(No test)




