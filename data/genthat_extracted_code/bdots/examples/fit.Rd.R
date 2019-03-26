library(bdots)


### Name: Fitting Step
### Title: Fit Subjects Individual Curves
### Aliases: doubleGauss.fit logistic.fit
### Keywords: htest

### ** Examples

## Not run: 
##D data(ci)
##D ci.1 <- subset(ci, ci$LookType == "Target")
##D ci.1$Group <- ci.1$protocol
##D out.1 <- logistic.fit(ci.1, 4)
##D out.2 <- logistic.boot(out.1)
##D replot(out.2, bucket.lim = c(0, 1))
##D 
##D ci.2 <- subset(ci, ci$LookType == "Cohort" | ci$LookType == "Unrelated")
##D ci.2$Group <- ci.2$protocol
##D ci.2$Curve <- ifelse(ci.2$LookType == "Cohort", 1, 2)
##D out.1 <- doubleGauss.fit(ci.2, 4, diffs = TRUE)
##D out.1 <- doubleGauss.refit(out.1, subj = c(13, 23), group = c(2, 2),
##D 	curves = c(2, 2), cor = c(FALSE, FALSE))
##D out.2 <- doubleGauss.boot(out.1)
##D replot(out.2, ylim = c(-0.01, 0.1), bucket.lim = c(0, 0.08))
## End(Not run)


