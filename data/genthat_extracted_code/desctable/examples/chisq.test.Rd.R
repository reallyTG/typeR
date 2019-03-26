library(desctable)


### Name: chisq.test
### Title: Pearson's Chi-squared Test for Count Data
### Aliases: chisq.test chisq.test.default chisq.test.formula

### ** Examples

## Not run: 
##D ## From Agresti(2007) p.39
##D M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
##D dimnames(M) <- list(gender = c("F", "M"),
##D                     party = c("Democrat","Independent", "Republican"))
##D (Xsq <- chisq.test(M))  # Prints test summary
##D Xsq$observed   # observed counts (same as M)
##D Xsq$expected   # expected counts under the null
##D Xsq$residuals  # Pearson residuals
##D Xsq$stdres     # standardized residuals
##D 
##D 
##D ## Effect of simulating p-values
##D x <- matrix(c(12, 5, 7, 7), ncol = 2)
##D chisq.test(x)$p.value           # 0.4233
##D chisq.test(x, simulate.p.value = TRUE, B = 10000)$p.value
##D                                 # around 0.29!
##D 
##D ## Testing for population probabilities
##D ## Case A. Tabulated data
##D x <- c(A = 20, B = 15, C = 25)
##D chisq.test(x)
##D chisq.test(as.table(x))             # the same
##D x <- c(89,37,30,28,2)
##D p <- c(40,20,20,15,5)
##D try(
##D chisq.test(x, p = p)                # gives an error
##D )
##D chisq.test(x, p = p, rescale.p = TRUE)
##D                                 # works
##D p <- c(0.40,0.20,0.20,0.19,0.01)
##D                                 # Expected count in category 5
##D                                 # is 1.86 < 5 ==> chi square approx.
##D chisq.test(x, p = p)            #               maybe doubtful, but is ok!
##D chisq.test(x, p = p, simulate.p.value = TRUE)
##D 
##D ## Case B. Raw data
##D x <- trunc(5 * runif(100))
##D chisq.test(table(x))            # NOT 'chisq.test(x)'!
##D 
##D ###
## End(Not run)



