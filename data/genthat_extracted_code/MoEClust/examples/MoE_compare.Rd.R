library(MoEClust)


### Name: MoE_compare
### Title: Choose the best MoEClust model
### Aliases: MoE_compare print.MoECompare
### Keywords: clustering main

### ** Examples

data(CO2data)
GNP   <- CO2data[,1]
CO2   <- CO2data[,2]
m1    <- MoE_clust(CO2, G=1:2)
m2    <- MoE_clust(CO2, G=1:2, gating= ~ GNP)
m3    <- MoE_clust(CO2, G=1:2, expert= ~ GNP)
m4    <- MoE_clust(CO2, G=1:2, gating= ~ GNP, expert= ~ GNP)
m5    <- MoE_clust(CO2, G=1:2, equalPro=TRUE)
m6    <- MoE_clust(CO2, G=1:2, expert= ~ GNP, equalPro=TRUE)

# Rank only the optimal models and examine the best model
(comp <- MoE_compare(m1, m2, m3, m4, m5, m6, pick=6, optimal.only=TRUE))
(best <- comp$optimal)
(summ <- summary(best))

# Examine all models visited, including those already deemed suboptimal
# Only print models with expert covariates & more than one component
comp2 <- MoE_compare(m1, m2, m3, m4, m5, m6, pick=18)
print(comp2, comp2$expert != "None" & comp2$G > 1)



