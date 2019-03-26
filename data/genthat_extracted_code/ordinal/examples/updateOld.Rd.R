library(ordinal)


### Name: update.clm2
### Title: Update method for cumulative link models
### Aliases: update.clm2 update.clmm2
### Keywords: internal

### ** Examples

options(contrasts = c("contr.treatment", "contr.poly"))

m1 <-  clm2(SURENESS ~ PROD, scale = ~PROD, data = soup,
           link = "logistic")

m2 <- update(m1, link = "probit")
m3 <- update(m1, link = "cloglog")
m4 <- update(m1, link = "loglog")
anova(m1, update(m1, scale = ~.-PROD))
mT1 <- update(m1, threshold = "symmetric")




