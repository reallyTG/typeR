library(sjPlot)


### Name: sjp.poly
### Title: Plot polynomials for (generalized) linear regression
### Aliases: sjp.poly

### ** Examples

library(sjmisc)
data(efc)
# linear fit. loess-smoothed line indicates a more
# or less cubic curve
sjp.poly(efc$c160age, efc$quol_5, 1)

# quadratic fit
sjp.poly(efc$c160age, efc$quol_5, 2)

# linear to cubic fit
sjp.poly(efc$c160age, efc$quol_5, 1:4, show.scatter = FALSE)


# fit sample model
fit <- lm(tot_sc_e ~ c12hour + e17age + e42dep, data = efc)
# inspect relationship between predictors and response
plot_model(fit, type = "slope")
# "e17age" does not seem to be linear correlated to response
# try to find appropiate polynomial. Grey line (loess smoothed)
# indicates best fit. Looks like x^4 has the best fit,
# however, only x^3 has significant p-values.
sjp.poly(fit, "e17age", 2:4, show.scatter = FALSE)

## Not run: 
##D # fit new model
##D fit <- lm(tot_sc_e ~ c12hour + e42dep + e17age + I(e17age^2) + I(e17age^3),
##D           data = efc)
##D # plot marginal effects of polynomial term
##D plot_model(fit, type = "pred", terms = "e17age")
## End(Not run)




