library(asbio)


### Name: panel.cor.res
### Title: Functions for customizing correlation matrices
### Aliases: panel.cor.res panel.lm
### Keywords: graphs htest

### ** Examples

data(asthma)
attach(asthma)
pairs(asthma,cex.labels=1,cex=.95,gap=.1,lower.panel=panel.cor.res,
upper.panel=panel.lm)



