library(heplots)


### Name: etasq
### Title: Measures of Partial Association (Eta-squared) for Linear Models
### Aliases: etasq etasq.lm etasq.mlm etasq.Anova.mlm
### Keywords: multivariate

### ** Examples

data(Soils)  # from car package
soils.mod <- lm(cbind(pH,N,Dens,P,Ca,Mg,K,Na,Conduc) ~ Block + Contour*Depth, data=Soils)
#Anova(soils.mod)
etasq(Anova(soils.mod))
etasq(soils.mod) # same
etasq(Anova(soils.mod), anova=TRUE)

etasq(soils.mod, test="Wilks")
etasq(soils.mod, test="Hotelling")



