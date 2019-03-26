library(GAD)


### Name: estimates
### Title: Estimates of an ANOVA design
### Aliases: estimates
### Keywords: design

### ** Examples

#Example 1
library(GAD)
data(rohlf95)
CG <- as.fixed(rohlf95$cages)
MQ <- as.random(rohlf95$mosquito) 
model_R <- lm(wing ~ CG + CG%in%MQ, data = rohlf95)
estimates(model_R)
##
##
#Example 2
data(snails)
O <- as.random(snails$origin)
S <- as.random(snails$shore)
B <- as.random(snails$boulder)
C <- as.random(snails$cage)
model_C <- lm(growth ~ O + S + O*S + B%in%S + O*(B%in%S) + C%in%(O*(B%in%S)),
              data = snails)
estimates(model_C)



