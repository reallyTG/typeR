library(BSagri)


### Name: CIGLM
### Title: Wrapper to compute confidence intervals from glms
### Aliases: CIGLM
### Keywords: htest

### ** Examples


data(Diptera)
library(multcomp)

modelfit <- glm(Ges ~ Treatment, data=Diptera, family=quasipoisson)
comps <- glht(modelfit, mcp(Treatment="Tukey"))
CIs<-CIGLM(comps, method="Raw")
CIs

CIsAdj<-CIGLM(comps, method="Adj")
CIsAdj

CIsBonf<-CIGLM(comps, method="Bonf")
CIsBonf

library(gamlss)

modelfit2 <- gamlss(Ges ~ Treatment, data=Diptera, family=NBI)
comps2 <- glht(modelfit2, mcp(Treatment="Tukey"))
CIs2<-CIGLM(comps2, method="Raw")
CIs2

CIsAdj2<-CIGLM(comps2, method="Adj")
CIsAdj2

CIsBonf2<-CIGLM(comps2, method="Bonf")
CIsBonf2






