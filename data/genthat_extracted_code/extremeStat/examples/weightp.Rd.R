library(extremeStat)


### Name: weightp
### Title: distribution weights
### Aliases: weightp
### Keywords: datasets

### ** Examples


data(weightp)
data.frame(weightp)
barplot(weightp, horiz=TRUE, las=1)
stopifnot(   all.equal(sum(weightp), 1)   )

data(annMax) ; data(weightp)
dlf <- distLfit(annMax, weightc=weightp)
dlf$gof
quant <- distLquantile(annMax, weightc=weightp)
quant




