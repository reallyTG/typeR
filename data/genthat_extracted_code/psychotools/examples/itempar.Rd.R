library(psychotools)


### Name: itempar
### Title: Extract Item Parameters of Item Response Models
### Aliases: itempar itempar.btmodel itempar.raschmodel itempar.rsmodel
###   itempar.pcmodel itempar.plmodel itempar.gpcmodel itempar.raschtree
###   itempar.bttree coef.itempar print.itempar vcov.itempar
### Keywords: classes

### ** Examples

o <- options(digits = 4)

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit a Rasch model to dichotomized verbal aggression data
raschmod <- raschmodel(VerbalAggression$resp2)

## extract item parameters with sum zero or use last two items as anchor
ip1 <- itempar(raschmod)
ip2a <- itempar(raschmod, ref = 23:24) # with position indices
ip2b <- itempar(raschmod, ref = c("S4WantShout", "S4DoShout")) # with item label

ip1
ip2a

all.equal(ip2a, ip2b)

## extract vcov
vc1 <- vcov(ip1)
vc2 <- vcov(ip2a)

## adjusted standard errors,
## smaller with more items used as anchors
sqrt(diag(vc1))
sqrt(diag(vc2))

## Wald confidence intervals
confint(ip1)
confint(ip2a)

options(digits = o$digits)



