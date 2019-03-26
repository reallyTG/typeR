library(Rfast2)


### Name: Trimmed mean
### Title: Trimmed mean
### Aliases: trim.mean colTrimMean rowTrimMean

### ** Examples

x <- rnorm(100, 1, 1)
all.equal(trim.mean(x, 0.05),mean(x, 0.05))

x<-matrix(x,10,10)

colTrimMean(x,0.05)
rowTrimMean(x,0.05)



