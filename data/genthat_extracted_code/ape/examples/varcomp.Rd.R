library(ape)


### Name: varcomp
### Title: Compute Variance Component Estimates
### Aliases: varcomp
### Keywords: regression dplot

### ** Examples

data(carnivora)
library(nlme)
m <- lme(log10(SW) ~ 1, random = ~ 1|Order/SuperFamily/Family/Genus, data=carnivora)
v <- varcomp(m, TRUE, TRUE)
plot(v)



