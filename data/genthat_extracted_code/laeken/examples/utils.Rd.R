library(laeken)


### Name: utils
### Title: Utility functions for indicators on social exclusion and poverty
### Aliases: is.arpr is.gini is.gpg is.indicator is.prop is.qsr is.rmpg
###   print.arpr print.indicator print.rmpg subset.arpr subset.indicator
###   subset.rmpg utils
### Keywords: survey

### ** Examples

data(eusilc)

# at-risk-of-poverty rate
a <- arpr("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)
print(a)
is.arpr(a)
is.indicator(a)
subset(a, strata = c("Lower Austria", "Vienna"))

# quintile share ratio
q <- qsr("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)
print(q)
is.qsr(q)
is.indicator(q)
subset(q, strata = c("Lower Austria", "Vienna"))

# relative median at-risk-of-poverty gap
r <- rmpg("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)
print(r)
is.rmpg(r)
is.indicator(r)
subset(r, strata = c("Lower Austria", "Vienna"))

# Gini coefficient
g <- gini("eqIncome", weights = "rb050",
    breakdown = "db040", data = eusilc)
print(g)
is.gini(g)
is.indicator(g)
subset(g, strata = c("Lower Austria", "Vienna"))



