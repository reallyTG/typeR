library(WebPower)


### Name: wp.mediation
### Title: Statistical Power Analysis for Simple Mediation
### Aliases: wp.mediation

### ** Examples

## No test: 
#To calculate the statistical power given sample size and effect size:
wp.mediation(n = 100, power = NULL, a = 0.5, b = 0.5,
                  varx = 1, vary = 1, varm = 1, alpha = 0.05)
#    Power for simple mediation
#
#        n     power   a   b varx varm vary alpha
#      100 0.9337271 0.5 0.5    1    1    1  0.05
#  
#    URL: http://psychstat.org/mediation

#To generate a power curve given a sequence of sample sizes:
res <- wp.mediation(n = seq(50,100,5), power = NULL, a = 0.5, b = 0.5,
                            varx = 1, vary = 1, varm = 1, alpha = 0.05)
res
#    Power for simple mediation
#  
#        n     power   a   b varx varm vary alpha
#       50 0.6877704 0.5 0.5    1    1    1  0.05
#       55 0.7287681 0.5 0.5    1    1    1  0.05
#       60 0.7652593 0.5 0.5    1    1    1  0.05
#       65 0.7975459 0.5 0.5    1    1    1  0.05
#       70 0.8259584 0.5 0.5    1    1    1  0.05
#       75 0.8508388 0.5 0.5    1    1    1  0.05
#       80 0.8725282 0.5 0.5    1    1    1  0.05
#       85 0.8913577 0.5 0.5    1    1    1  0.05
#       90 0.9076417 0.5 0.5    1    1    1  0.05
#       95 0.9216744 0.5 0.5    1    1    1  0.05
#      100 0.9337271 0.5 0.5    1    1    1  0.05
#  
#    URL: http://psychstat.org/mediation

#To plot the power curve:
plot(res)

#To calculate the required sample size given power and effect size:
wp.mediation(n = NULL, power = 0.9, a = 0.5, b = 0.5,
                varx = 1, vary = 1, varm = 1, alpha = 0.05)
#    Power for simple mediation
#
#             n power   a   b varx varm vary alpha
#      87.56182   0.9 0.5 0.5    1    1    1  0.05
#  
#    URL: http://psychstat.org/mediation

#To calculate the minimum detectable effect size of one coefficent given power and sample size:
wp.mediation(n = 100, power = 0.9, a = NULL, b = 0.5,
               varx = 1, vary = 1, varm = 1, alpha = 0.05)
#    Power for simple mediation
#  
#                     n power         a   b varx varm vary alpha
#      100   0.9 0.7335197 0.5    1    1    1  0.05
#  
#    URL: http://psychstat.org/mediation
## End(No test)




