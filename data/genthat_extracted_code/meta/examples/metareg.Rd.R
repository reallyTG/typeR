library(meta)


### Name: metareg
### Title: Meta-regression
### Aliases: metareg
### Keywords: print

### ** Examples

data(Fleiss93cont)

# Add some (fictitious) grouping variables:
Fleiss93cont$age <- c(55, 65, 55, 65, 55)
Fleiss93cont$region <- c("Europe", "Europe", "Asia", "Asia", "Europe")

meta1 <- metacont(n.e, mean.e, sd.e,
                  n.c, mean.c, sd.c,
                  data = Fleiss93cont, sm = "MD")


mu1 <- update(meta1, byvar = region)

mu2 <- update(meta1, byvar = region,
              tau.common = TRUE, comb.fixed = FALSE)

## Not run: 
##D # Warnings due to wrong ordering of arguments (order has changed with
##D # version 3.0-0 of R package meta)
##D #
##D metareg(~ region, meta1)
##D metareg(~ region, data = meta1)
##D 
##D # Warning as no information on covariate is available
##D #
##D metareg(meta1)
## End(Not run)

# Do meta-regression for covariate region
# (see R code to create object mu2)
#
metareg(mu2)

# Same result for
# - tau-squared
# - test of heterogeneity
# - test for subgroup differences
# (as argument 'tau.common' was used to create mu2)
#
mu2
metareg(mu2, intercept = FALSE)
metareg(meta1, region)
#
# Different result for
# - tau-squared
# - test of heterogeneity
# - test for subgroup differences
# (as argument 'tau.common' is - by default - FALSE)
#
mu1

# Generate bubble plot
#
bubble(metareg(mu2))

# Do meta-regression with two covariates
#
metareg(mu1, region + age)

# Do same meta-regressions using 'official' formula notation
#
metareg(meta1, ~ region)
metareg(mu1, ~ region + age)

# Do meta-regression using REML method and print intermediate results
# for iterative estimation algorithm; furthermore print results with
# three digits.
#
metareg(mu1, region, method.tau = "REML",
        control = list(verbose = TRUE), digits = 3)

# Use Hartung-Knapp method
#
mu3 <- update(mu2, hakn = TRUE)
mu3
metareg(mu3, intercept = FALSE)



