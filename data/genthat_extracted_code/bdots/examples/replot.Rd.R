library(bdots)


### Name: replot
### Title: Replot Boostrapped Output
### Aliases: replot
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.1 <- subset(ci, ci$LookType == "Target")
##D ci.1$Group <- ci.1$protocol
##D out.1 <- logistic.fit(ci.1, 4)
##D out.2 <- logistic.boot(out.1)
##D replot(out.2, bucket.lim = c(0, 1))
## End(Not run)


