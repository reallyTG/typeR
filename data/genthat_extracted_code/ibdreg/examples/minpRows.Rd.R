library(ibdreg)


### Name: minpRows
### Title: find the rows of a data frame with the minimum pvalue
### Aliases: minpRows

### ** Examples

## create a data frame of chi-square(1) tests
tests <- data.frame(pos=1:3, chitest=c(3,4,2), df=rep(1,3), 
                    pval=1-pchisq(c(3,4,2), df=1))

# find the rows of the best tests
best.tests <- minpRows(tests, colnames=c("position", "chi.test", "df","pvalue"))



