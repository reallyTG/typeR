library(bayesdistreg)


### Name: lapl_aprx
### Title: Laplace approximation of posterior to normal
### Aliases: lapl_aprx

### ** Examples

 y = indicat(faithful$waiting,mean(faithful$waiting)) 
 x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
 gg<- lapl_aprx(y,x)




