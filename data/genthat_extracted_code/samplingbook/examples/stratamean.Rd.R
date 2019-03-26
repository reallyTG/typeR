library(samplingbook)


### Name: stratamean
### Title: Stratified Sample Mean Estimation
### Aliases: stratamean

### ** Examples

# random data
testy <- rnorm(100)
testh <- c(rep("male",40), rep("female",60))
stratamean(testy, testh, wh=c(0.5, 0.5))
stratamean(testy, testh, wh=c(0.5, 0.5), eae=TRUE)

# tax data
data(tax)
summary(tax)

nh <- as.vector(table(tax$Class))
wh <- nh/sum(nh)
stratamean(y=tax$diff, h=as.vector(tax$Class), wh=wh, eae=TRUE)



