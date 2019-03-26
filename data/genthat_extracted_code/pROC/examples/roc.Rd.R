library(pROC)


### Name: roc
### Title: Build a ROC curve
### Aliases: roc roc.formula roc.default
### Keywords: univar nonparametric utilities roc

### ** Examples

data(aSAH)

# Basic example
roc(aSAH$outcome, aSAH$s100b,
    levels=c("Good", "Poor"))
# As levels aSAH$outcome == c("Good", "Poor"),
# this is equivalent to:
roc(aSAH$outcome, aSAH$s100b)
# In some cases, ignoring levels could lead to unexpected results
# Equivalent syntaxes:
roc(outcome ~ s100b, aSAH)
roc(aSAH$outcome ~ aSAH$s100b)
with(aSAH, roc(outcome, s100b))
with(aSAH, roc(outcome ~ s100b))

# With a formula:
roc(outcome ~ s100b, data=aSAH)

# Using subset (only with formula)
roc(outcome ~ s100b, data=aSAH, subset=(gender == "Male"))
roc(outcome ~ s100b, data=aSAH, subset=(gender == "Female"))

# With numeric controls/cases
roc(controls=aSAH$s100b[aSAH$outcome=="Good"], cases=aSAH$s100b[aSAH$outcome=="Poor"])
# With ordered controls/cases
roc(controls=aSAH$wfns[aSAH$outcome=="Good"], cases=aSAH$wfns[aSAH$outcome=="Poor"])

# Inverted the levels: "Poor" are now controls and "Good" cases:
roc(aSAH$outcome, aSAH$s100b,
    levels=c("Poor", "Good"))

# The result was exactly the same because of direction="auto".
# The following will give an AUC < 0.5:
roc(aSAH$outcome, aSAH$s100b,
    levels=c("Poor", "Good"), direction="<")

# If we are sure about levels and direction auto-detection,
# we can turn off the messages:
roc(aSAH$outcome, aSAH$s100b, quiet = TRUE)

# If we prefer counting in percent:
roc(aSAH$outcome, aSAH$s100b, percent=TRUE)

# Test the different algorithms:
roc(aSAH$outcome, aSAH$s100b, algorithm = 1)
roc(aSAH$outcome, aSAH$s100b, algorithm = 2)
roc(aSAH$outcome, aSAH$s100b, algorithm = 3)
if (require(microbenchmark)) {
  roc(aSAH$outcome, aSAH$s100b, algorithm = 0)
}

# Plot and CI (see plot.roc and ci for more options):
roc(aSAH$outcome, aSAH$s100b,
    percent=TRUE, plot=TRUE, ci=TRUE)

# Smoothed ROC curve
roc(aSAH$outcome, aSAH$s100b, smooth=TRUE)
# this is not identical to
smooth(roc(aSAH$outcome, aSAH$s100b))
# because in the latter case, the returned object contains no AUC



