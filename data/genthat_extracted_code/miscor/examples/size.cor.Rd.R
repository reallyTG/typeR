library(miscor)


### Name: size.cor
### Title: Sample size determination for testing the product-moment
###   correlation coefficient
### Aliases: size.cor

### ** Examples

#--------------------------------------
# H0: rho = 0.3, H1: rho != 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

size.cor(rho = 0.3, delta = 0.2, alpha = 0.05, beta = 0.2)

#--------------------------------------
# H0: rho <= 0.3, H1: rho > 0.3
# alpha = 0.05, beta = 0.2, delta = 0.2

size.cor(rho = 0.3, delta = 0.2, alternative = "greater",
         alpha = 0.05, beta = 0.2)



