library(ordinal)


### Name: anova.clm
### Title: ANODE Tables and Likelihood ratio test of cumulative link models
### Aliases: anova.clm
### Keywords: models

### ** Examples


## Analysis of deviance tables with Wald chi-square tests:
fm <- clm(rating ~ temp * contact, scale=~contact, data=wine)
anova(fm, type="I")
anova(fm, type="II")
anova(fm, type="III")

options(contrasts = c("contr.treatment", "contr.poly"))
m1 <- clm2(SURENESS ~ PROD, scale = ~PROD, data = soup,
          link = "logistic")

## anova
anova(m1, update(m1, scale = ~.-PROD))
mN1 <- clm2(SURENESS ~ 1, nominal = ~PROD, data = soup,
           link = "logistic")
anova(m1, mN1)
anova(m1, update(m1, scale = ~.-PROD), mN1)

## Fit model from polr example:
if(require(MASS)) {
    fm1 <- clm2(Sat ~ Infl + Type + Cont, weights = Freq, data = housing)
    anova(fm1, update(fm1, scale =~ Cont))
}




