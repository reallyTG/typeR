library(GAD)


### Name: gad
### Title: General ANOVA Design
### Aliases: gad
### Keywords: design

### ** Examples

#Example 1
library(GAD)
data(rohlf95)
CG <- as.fixed(rohlf95$cages)
MQ <- as.random(rohlf95$mosquito) 
model <- lm(wing ~ CG + CG%in%MQ, data = rohlf95)
gad(model)
##
##
#Example 2
data(rats)
names(rats)
TR <- as.fixed(rats$treat)
RA <- as.random(rats$rat)
LI <- as.random(rats$liver)
model <- lm(glycog ~ TR + RA%in%TR + LI%in%RA%in%TR, data=rats)
gad(model)
##
##
#Example 3
data(snails)
O <- as.random(snails$origin)
S <- as.random(snails$shore)
B <- as.random(snails$boulder)
C <- as.random(snails$cage)
model <- lm(growth ~ O + S + O*S + B%in%S + O*(B%in%S) + C%in%(O*(B%in%S)), 
            data = snails)
gad(model)



