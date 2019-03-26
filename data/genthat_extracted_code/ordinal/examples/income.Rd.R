library(ordinal)


### Name: income
### Title: Income distribution (percentages) in the Northeast US
### Aliases: income
### Keywords: datasets

### ** Examples


print(income)

## Convenient table:
(tab <- xtabs(pct ~ year + income, income))

## small rounding error in 1970:
rowSums(tab)

## compare link functions via the log-likelihood:
links <- c("logit", "probit", "cloglog", "loglog", "cauchit")
sapply(links, function(link) {
  clm(income ~ year, data=income, weights=pct, link=link)$logLik })
## a heavy tailed (cauchy) or left skew (cloglog) latent distribution
## is fitting best.

## The data are defined as:
income.levels <- c(0, 3, 5, 7, 10, 12, 15)
income <- paste(income.levels, c(rep("-", 6), "+"),
                c(income.levels[-1], ""), sep = "")
income <-
  data.frame(year=factor(rep(c("1960", "1970"), each = 7)),
             pct = c(6.5, 8.2, 11.3, 23.5, 15.6, 12.7, 22.2,
               4.3, 6, 7.7, 13.2, 10.5, 16.3, 42.1),
             income=factor(rep(income, 2), ordered=TRUE,
               levels=income))




