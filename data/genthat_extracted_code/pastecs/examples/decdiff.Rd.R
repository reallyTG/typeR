library(pastecs)


### Name: decdiff
### Title: Time series decomposition using differences (trend elimination)
### Aliases: decdiff
### Keywords: ts smooth

### ** Examples

data(marbio)
ClausoB.ts <- ts(log(marbio$ClausocalanusB + 1))
ClausoB.dec <- decdiff(ClausoB.ts, lag=1, order=2, ends="fill")
plot(ClausoB.dec, col=c(1, 4, 2), xlab="stations")



