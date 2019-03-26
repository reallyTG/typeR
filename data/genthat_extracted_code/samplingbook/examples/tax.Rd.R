library(samplingbook)


### Name: tax
### Title: Hypothetical Tax Refund Data Frame
### Aliases: tax
### Keywords: datasets

### ** Examples

data(tax)
summary(tax)

# illustration of stratamean
nh <- as.vector(table(tax$Class))
wh <- nh/sum(nh)
stratamean(y=tax$diff, h=as.vector(tax$Class), wh=wh, eae=TRUE)



