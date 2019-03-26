library(R330)


### Name: coag.df
### Title: Blood Coagulation Data
### Aliases: coag.df
### Keywords: datasets

### ** Examples

data(coag.df)
coag.lm <- lm(coag ~ diet,data = coag.df)
anova(coag.lm)



