library(ordinal)


### Name: anova.clm2
### Title: Likelihood ratio test of cumulative link models
### Aliases: anova.clm2 anova.clmm2
### Keywords: internal

### ** Examples

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




