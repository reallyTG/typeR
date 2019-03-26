library(bdots)


### Name: subs.delete
### Title: Delete individual subjects from both data and fits
### Aliases: subs.delete
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.1 <- subset(ci, ci$LookType == "Target")
##D ci.1$Group <- ci.1$protocol
##D out.1 <- logistic.fit(ci.1, 4)ests.plot(out.1)
##D #Remove subject 1 from group 1 and subject 10 from group 2
##D out.1 <- subjs.delete(out.1, subj = c(1, 10), group = c(1, 2))
## End(Not run)


