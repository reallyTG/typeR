library(zipfR)


### Name: lnre.goodness.of.fit
### Title: Goodness-of-fit Evaluation of LNRE Models (zipfR)
### Aliases: lnre.goodness.of.fit
### Keywords: optimize models

### ** Examples


## load spectrum of first 100k Brown tokens
data(Brown100k.spc)

## use this spectrum to compute zm and gigp
## models
zm <- lnre("zm",Brown100k.spc)
gigp <- lnre("gigp",Brown100k.spc)

## lnre.goodness.of.fit with appropriate
## n.estimated value produces the same multivariate
## chi-squared test that is reported in a model
## summary

## compare:
zm
lnre.goodness.of.fit(zm,Brown100k.spc,n.estimated=2)

gigp
lnre.goodness.of.fit(gigp,Brown100k.spc,n.estimated=3)

## goodness of fit of the 100k models calculated on the
## whole Brown spectrum (although this is superset of
## 100k spectrum, let's pretend it is an independent
## spectrum, and set n.estimated to 0)

data(Brown.spc)

lnre.goodness.of.fit(zm,Brown.spc,n.estimated=0)
lnre.goodness.of.fit(gigp,Brown.spc,n.estimated=0)





