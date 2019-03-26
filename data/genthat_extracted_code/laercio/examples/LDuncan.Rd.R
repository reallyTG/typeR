library(laercio)


### Name: LDuncan
### Title: Duncan test
### Aliases: LDuncan
### Keywords: htest

### ** Examples

require(laercio)
ldata$trat <- as.factor(ldata$trat)
anv <- aov(resp~trat,ldata)
anova(anv)
LDuncan(anv,"trat")



