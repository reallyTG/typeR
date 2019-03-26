library(vcdExtra)


### Name: Accident
### Title: Traffic Accident Victims in France in 1958
### Aliases: Accident
### Keywords: datasets

### ** Examples

# examples
data(Accident)
head(Accident)

# for graphs, reorder mode
Accident$mode <- ordered(Accident$mode,
   levels=levels(Accident$mode)[c(4,2,3,1)])

# Bertin's table
accident_tab <- xtabs(Freq ~ gender+mode+age+result, data=Accident)
structable(mode+gender ~ age+result, data=accident_tab)

## Loglinear models
## ----------------

# mutual independence
acc.mod0 <- glm(Freq ~ age+result+mode+gender, data=Accident, family=poisson)
LRstats(acc.mod0)
mosaic(acc.mod0, ~mode+age+gender+result)

# result as a response
acc.mod1 <- glm(Freq ~ age*mode*gender + result, data=Accident, family=poisson)
LRstats(acc.mod1)
mosaic(acc.mod1, ~mode+age+gender+result, 
    labeling_args = list(abbreviate = c(gender=1, result=4)))

# allow two-way association of result with each explanatory variable
acc.mod2 <- glm(Freq ~ age*mode*gender + result*(age+mode+gender), data=Accident, family=poisson)
LRstats(acc.mod2)
mosaic(acc.mod2, ~mode+age+gender+result, 
    labeling_args = list(abbreviate = c(gender=1, result=4)))

acc.mods <- glmlist(acc.mod0, acc.mod1, acc.mod2)
LRstats(acc.mods)

## Binomial (logistic regression) models for result
## ------------------------------------------------
library(car)  # for Anova()
acc.bin1 <- glm(result=='Died' ~ age+mode+gender, 
    weights=Freq, data=Accident, family=binomial)
Anova(acc.bin1)
acc.bin2 <- glm(result=='Died' ~ (age+mode+gender)^2, 
    weights=Freq, data=Accident, family=binomial)
Anova(acc.bin2)
acc.bin3 <- glm(result=='Died' ~ (age+mode+gender)^3, 
    weights=Freq, data=Accident, family=binomial)
Anova(acc.bin3)

# compare models
anova(acc.bin1, acc.bin2, acc.bin3, test="Chisq")

# visualize probability of death with effect plots
## Not run: 
##D library(effects)
##D plot(allEffects(acc.bin1), ylab='Pr (Died)')
##D 
##D plot(allEffects(acc.bin2), ylab='Pr (Died)')
## End(Not run)


#


