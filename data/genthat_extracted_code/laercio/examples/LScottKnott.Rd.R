library(laercio)


### Name: LScottKnott
### Title: Scott-Knott test
### Aliases: LScottKnott
### Keywords: htest

### ** Examples

#completely random design
require(laercio)
ldata$trat <- factor(ldata$trat)
anv <- aov(resp~trat,ldata)
anova(anv)
LScottKnott(anv,"trat")

#randomized complete block design
require(laercio)
ldata$trat <- factor(ldata$trat)
ldata$block <- factor(ldata$block)
anv <- aov(resp~trat+block,ldata)
anova(anv)
LScottKnott(anv,"trat")
LScottKnott(anv,"block")




