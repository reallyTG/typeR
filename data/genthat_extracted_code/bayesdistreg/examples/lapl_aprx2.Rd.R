library(bayesdistreg)


### Name: lapl_aprx2
### Title: Laplace approximation of posterior to normal
### Aliases: lapl_aprx2

### ** Examples

y = indicat(faithful$waiting,mean(faithful$waiting)) 
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
(gg<- lapl_aprx2(y,x)); coef(gg); vcov(gg)




