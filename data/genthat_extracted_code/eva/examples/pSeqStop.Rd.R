library(eva)


### Name: pSeqStop
### Title: P-Value Sequential Adjustment
### Aliases: pSeqStop

### ** Examples

x <- rgevr(500, 10, loc = 0.5, scale = 1, shape = 0.5)
y <- gevrSeqTests(x, method = "ed")
pSeqStop(rev(y$p.values))



