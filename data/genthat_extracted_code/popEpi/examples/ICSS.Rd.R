library(popEpi)


### Name: ICSS
### Title: Age standardisation weights from the ICSS scheme.
### Aliases: ICSS

### ** Examples

## aggregate weights to a subset of age groups
data(ICSS)
cut <- c(0, 30, 50, 70, Inf)
agegr <- cut(ICSS$age, cut, right = FALSE)
aggregate(ICSS1~agegr, data = ICSS, FUN = sum)



