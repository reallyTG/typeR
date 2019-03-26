library(Sleuth2)


### Name: case1302
### Title: Pygmalion Effect
### Aliases: case1302
### Keywords: datasets

### ** Examples

str(case1302)

# two-way model with interactions
fitfull <- aov(Score ~ Company*Treat, case1302)
# No problems are indicated by residual plot
plot(fitfull)
# Interaction terms are not statistically significant
anova(fitfull)  
# Additive model, with "treatment contrast" for treatment:
fitadditive <- aov(Score ~ Company + Treat, case1302)
# Interpret treatment effect as coefficient of Treat
anova(fitadditive)  



