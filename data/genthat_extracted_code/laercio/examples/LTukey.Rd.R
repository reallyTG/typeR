library(laercio)


### Name: LTukey
### Title: Tukey test
### Aliases: LTukey
### Keywords: htest

### ** Examples

require(laercio)
ldata$trat <- as.factor(ldata$trat)
anv <- aov(resp~trat,ldata)
anova(anv)
LTukey(anv,"trat")



