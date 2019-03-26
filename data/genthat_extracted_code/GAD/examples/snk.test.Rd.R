library(GAD)


### Name: snk.test
### Title: Student-Newman-Keuls (SNK) procedure
### Aliases: snk.test
### Keywords: htest

### ** Examples

library(GAD)
data(rohlf95)
CG <- as.fixed(rohlf95$cages)
MQ <- as.random(rohlf95$mosquito) 
model <- lm(wing ~ CG + CG%in%MQ, data = rohlf95)
gad(model)
##Check estimates to see model structure
estimates(model)
snk.test(model,term = 'CG:MQ', among = 'MQ', within = 'CG')
##
##
##Example using snails dataset
data(snails)
O <- as.random(snails$origin)
S <- as.random(snails$shore)
B <- as.random(snails$boulder)
C <- as.random(snails$cage)
model <- lm(growth ~ O + S + O*S + B%in%S + O*(B%in%S) + C%in%(O*(B%in%S)), 
            data = snails)
gad(model)
##Check estimates to see model structure
estimates(model)
snk.test(model, term = 'O')
snk.test(model,term = 'O:S', among = 'S', within = 'O')
#if term O:S:B were significant, we could try 
snk.test(model, term = 'O:S:B', among = 'B', within = 'O:S')



