library(laercio)


### Name: ldata
### Title: Data for examples
### Aliases: ldata
### Keywords: data

### ** Examples

require(laercio)
ldata$trat <- as.factor(ldata$trat)
anv <- aov(resp~trat,ldata)
anova(anv)
LTukey(anv,"trat")



