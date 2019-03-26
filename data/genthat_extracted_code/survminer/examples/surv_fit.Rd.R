library(survminer)


### Name: surv_fit
### Title: Create Survival Curves
### Aliases: surv_fit

### ** Examples


library("survival")
library("magrittr")

# Case 1: One formula and One data set
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit <- surv_fit(Surv(time, status) ~ sex,
               data = colon)
surv_pvalue(fit)


# Case 2: List of formulas and One data set.
#   - Different formulas are applied to the same data set
#   - Returns a (named) list of survfit objects
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Create a named list of formulas
formulas <- list(
 sex = Surv(time, status) ~ sex,
 rx = Surv(time, status) ~ rx
)

# Fit survival curves for each formula
fit <- surv_fit(formulas, data = colon)
surv_pvalue(fit)

# Case 3: One formula and List of data sets
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
fit <- surv_fit(Surv(time, status) ~ sex,
               data = list(colon, lung))
surv_pvalue(fit)


# Case 4: List of formulas and List of data sets
#  - Each formula is applied to each of the data in the data list
#  - argument: match.fd = FALSE
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Create two data sets
set.seed(123)
colon1 <- dplyr::sample_frac(colon, 1/2)
set.seed(1234)
colon2 <- dplyr::sample_frac(colon, 1/2)

# Create a named list of formulas
formula.list <- list(
 sex = Surv(time, status) ~ sex,
 adhere = Surv(time, status) ~ adhere,
 rx = Surv(time, status) ~ rx
)

# Fit survival curves
fit <- surv_fit(formula.list, data = list(colon1, colon2),
               match.fd = FALSE)
surv_pvalue(fit)


# Grouped survfit
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# - Group by the treatment "rx" and fit survival curves on each subset
# - Returns a list of survfit objects
fit <- surv_fit(Surv(time, status) ~ sex,
               data = colon, group.by = "rx")

# Alternatively, do this
fit <- colon %>%
 surv_group_by("rx") %>%
 surv_fit(Surv(time, status) ~ sex, data = .)

surv_pvalue(fit)




