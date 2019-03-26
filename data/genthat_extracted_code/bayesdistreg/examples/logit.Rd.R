library(bayesdistreg)


### Name: logit
### Title: Logit likelihood function
### Aliases: logit

### ** Examples

y = indicat(faithful$waiting,mean(faithful$waiting)) 
x = scale(cbind(faithful$eruptions,faithful$eruptions^2))
data = data.frame(y,x)
logit(rep(0,3),data)



