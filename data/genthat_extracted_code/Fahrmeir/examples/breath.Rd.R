library(Fahrmeir)


### Name: breath
### Title: Breathing Test
### Aliases: breath
### Keywords: datasets

### ** Examples

str(breath)
breath$Breathing.test <- ordered(breath$Breathing.test)
library(MASS)
breath.polr1 <- polr(Breathing.test ~ Age*Smoking.status, weight=n, 
                     data=breath)
breath.polr2 <- polr(Breathing.test ~ Age*Smoking.status, weight=n, 
                     data=breath, method="cloglog")
summary(breath.polr1)
summary(breath.polr2)
# continuation ratio models (as of page 89) might be fitted with
# Design or VGAM package.



