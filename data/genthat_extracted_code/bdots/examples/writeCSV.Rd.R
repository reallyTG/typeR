library(bdots)


### Name: bdots.write.csv
### Title: Write to CSV
### Aliases: bdots.write.csv
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.1 <- subset(ci, ci$LookType == "Target")
##D ci.1$Group <- ci.1$protocol
##D out.1 <- logistic.fit(ci.1, 4)
##D out.2 <- logistic.boot(out.1)
##D bdots.write.csv(out.1, out.2, "CIOutput.csv", row.names = FALSE)
## End(Not run)


