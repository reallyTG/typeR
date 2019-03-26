library(psychotools)


### Name: threshpar
### Title: Extract Threshold Parameters of Item Response Models
### Aliases: threshpar threshpar.raschmodel threshpar.rsmodel
###   threshpar.pcmodel threshpar.plmodel threshpar.gpcmodel coef.threshpar
###   print.threshpar
### Keywords: classes

### ** Examples

o <- options(digits = 4)

## load verbal aggression data
data("VerbalAggression", package = "psychotools")

## fit a rasch model to dichotomized verbal aggression data
raschmod <- raschmodel(VerbalAggression$resp2)

## extract threshold parameters with sum zero restriction
tr <- threshpar(raschmod)
tr

## compare to item parameters (again with sum zero restriction)
ip <- itempar(raschmod)
ip

all.equal(coef(tr), coef(ip))

## rating scale model example
rsmod <- rsmodel(VerbalAggression$resp)
trmod <- threshpar(rsmod, type = "mode")
trmed <- threshpar(rsmod, type = "median")
trmn <- threshpar(rsmod, type = "mean")

## compare different types of threshold parameters
cbind("Mode" = coef(trmod, type = "vector"),
 "Median" = coef(trmod, type = "vector"),
 "Mean" = coef(trmn, type = "vector"))

if(requireNamespace("mirt")) {
## fit a partial credit model and a generalized partial credit model
pcmod <- pcmodel(VerbalAggression$resp)
gpcmod <- gpcmodel(VerbalAggression$resp)

## extract the threshold parameters with different default restrictions and
## therefore incompareable scales
tp <- threshpar(pcmod)
tg <- threshpar(gpcmod)
plot(unlist(tp), unlist(tg), xlab = "PCM", ylab = "GPCM")
abline(a = 0, b = 1)

## extract the threshold parameters with the first as the reference leading
## to a compareable scale visualizing the differences due to different
## discrimination parameters
tp <- threshpar(pcmod, ref = 1)
tg <- threshpar(gpcmod, ref = 1)
plot(unlist(tp), unlist(tg), xlab = "PCM", ylab = "GPCM")
abline(a = 0, b = 1)

options(digits = o$digits)
}



