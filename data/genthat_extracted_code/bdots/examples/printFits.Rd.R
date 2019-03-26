library(bdots)


### Name: Print Fits
### Title: Print summary of quality of curve fits
### Aliases: printFits
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.2 <- subset(ci, ci$LookType == "Cohort" | ci$LookType == "Unrelated")
##D ci.2$Group <- ci.2$protocol
##D ci.2$Curve <- ifelse(ci.2$LookType == "Cohort", 1, 2)
##D out.1 <- doubleGauss.fit(ci.2, 4, diffs = TRUE)
##D out.1 <- doubleGauss.refit(out.1, subj = c(13, 23), group = c(2, 2),
##D 	curves = c(2, 2), cor = c(FALSE, FALSE))
##D printFits(out.1)
##D out.2 <- doubleGauss.boot(out.1)
##D replot(out.2, ylim = c(-0.01, 0.1), bucket.lim = c(0, 0.08))
## End(Not run)


