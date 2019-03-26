library(meta)


### Name: metabin
### Title: Meta-analysis of binary outcome data
### Aliases: metabin
### Keywords: htest

### ** Examples

#
# Calculate odds ratio and confidence interval for a single study
#
metabin(10, 20, 15, 20, sm = "OR")

#
# Different results (due to handling of studies with double zeros)
#
metabin(0, 10, 0, 10, sm = "OR")
metabin(0, 10, 0, 10, sm = "OR", allstudies = TRUE)


#
# Use subset of Olkin (1995) to conduct meta-analysis based on inverse
# variance method (with risk ratio as summary measure)
#
data(Olkin95)
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = c(41, 47, 51, 59),
                 method = "Inverse")
summary(meta1)


#
# Use different subset of Olkin (1995)
#
meta2 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = Olkin95$year < 1970,
                 method = "Inverse", studlab = author)
summary(meta2)
forest(meta2)
#
# Meta-analysis with odds ratio as summary measure
#
meta3 <- metabin(event.e, n.e, event.c, n.c,
                 data = Olkin95, subset = Olkin95$year < 1970,
                 sm = "OR", method = "Inverse", studlab = author)
# Same meta-analysis result using 'update.meta' function
meta3 <- update(meta2, sm = "OR")
summary(meta3)
#
# Meta-analysis based on Mantel-Haenszel method
# (with odds ratio as summary measure)
#
meta4 <- update(meta3, method = "MH")
summary(meta4)
#
# Meta-analysis based on Peto method
# (only available for odds ratio as summary measure)
#
meta5 <- update(meta3, method = "Peto")
summary(meta5)


## Not run: 
##D #
##D # Meta-analysis using generalised linear mixed models
##D # (only if R packages 'metafor' and 'lme4' are available)
##D #
##D if (suppressMessages(require(metafor, quietly = TRUE, warn = FALSE)) &
##D     require(lme4, quietly = TRUE)) {
##D #
##D # Logistic regression model with (k = 4) fixed study effects
##D # (default: model.glmm = "UM.FS")
##D #
##D meta6 <- metabin(event.e, n.e, event.c, n.c,
##D                  data = Olkin95, subset = Olkin95$year < 1970,
##D                  method = "GLMM")
##D # Same results:
##D meta6 <- update(meta2, method = "GLMM")
##D summary(meta6)
##D #
##D # Mixed-effects logistic regression model with random study effects
##D # (warning message printed due to argument 'nAGQ')
##D #
##D meta7 <- update(meta6, model.glmm = "UM.RS")
##D #
##D # Use additional argument 'nAGQ' for internal call of 'rma.glmm' function
##D #
##D meta7 <- update(meta6, model.glmm = "UM.RS", nAGQ = 1)
##D summary(meta7)
##D #
##D # Generalised linear mixed model (conditional Hypergeometric-Normal)
##D # (R package 'BiasedUrn' must be available)
##D #
##D if (require(BiasedUrn, quietly = TRUE)) {
##D  meta8 <- update(meta6, model.glmm = "CM.EL")
##D  summary(meta8)
##D }
##D #
##D # Generalised linear mixed model (conditional Binomial-Normal)
##D #
##D meta9 <- update(meta6, model.glmm = "CM.AL")
##D summary(meta9)
##D 
##D #
##D # Logistic regression model with (k = 70) fixed study effects
##D # (about 18 seconds with Intel Core i7-3667U, 2.0GHz)
##D #
##D meta10 <- metabin(event.e, n.e, event.c, n.c,
##D                   data = Olkin95, method = "GLMM")
##D summary(meta10)
##D #
##D # Mixed-effects logistic regression model with random study effects
##D # - about 50 seconds with Intel Core i7-3667U, 2.0GHz
##D # - several warning messages, e.g. "failure to converge, ..."
##D #
##D summary(update(meta10, model.glmm = "UM.RS"))
##D #
##D # Conditional Hypergeometric-Normal GLMM
##D # - long computation time (about 12 minutes with Intel Core i7-3667U, 2.0GHz)
##D # - estimation problems for this very large dataset:
##D #   * warning that Choleski factorization of Hessian failed
##D #   * confidence interval for treatment effect smaller in random
##D #     effects model compared to fixed effect model
##D #
##D if (require(BiasedUrn, quietly = TRUE)) {
##D  system.time(meta11 <- update(meta10, model.glmm = "CM.EL"))
##D  summary(meta11)
##D }
##D #
##D # Generalised linear mixed model (conditional Binomial-Normal)
##D # (less than 1 second with Intel Core i7-3667U, 2.0GHz)
##D #
##D summary(update(meta10, model.glmm = "CM.AL"))
##D }
## End(Not run)



