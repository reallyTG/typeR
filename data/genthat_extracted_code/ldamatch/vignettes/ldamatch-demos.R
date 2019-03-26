## ------------------------------------------------------------------------
library(ldamatch)
set.seed(257)

SIZE <- 15
condition <- as.factor(c(rep("control", 2 * SIZE), rep("treatment", SIZE)))
covariate1 <- c(rnorm(2 * SIZE), rnorm(SIZE, 1, 2))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariate1, t_halt)
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariate1, t_halt, method = "random")
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariate1, t_halt, method = "heuristic2")
print(table(condition, is.in))

## ------------------------------------------------------------------------
covariate2 <- c(rnorm(2 * SIZE), rnorm(SIZE, 1, 2))
covariates <- cbind(covariate1, covariate2)

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, t_halt)
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, t_halt, method = "heuristic2")
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, t_halt, method = "random")
print(table(condition, is.in))

## ------------------------------------------------------------------------
my.props <- prop.table(c(control = 4, treatment = 3))
is.in <- match_groups(condition, covariates, U_halt, props = my.props)
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, wilks_halt)
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, wilks_halt, method = "random")
print(table(condition, is.in))

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, t_halt, method = "heuristic1")
print(table(condition, is.in))

## ------------------------------------------------------------------------
t_ad_halt <- create_halting_test(c(t_halt, ad_halt))
threshes <- c(.2, .02)
is.in <- match_groups(condition, covariates, t_ad_halt, threshes)
print(table(condition, is.in))

## ------------------------------------------------------------------------
estimate_exhaustive(min_preserved = 42, condition, cases_per_second = 100)
foreach::registerDoSEQ()
is.ins <- match_groups(condition, covariate1, t_halt, method = "exhaustive", all_results = TRUE)
print(table(condition, is.ins[[1]]))
print(length(is.ins))

# (Confirm exhaustive search by applying heuristic1 search to it.)
is.in <- match_groups(condition[is.ins[[1]]], covariate1[is.ins[[1]]], t_halt)
print(table(condition[is.ins[[1]]], is.in))

## ------------------------------------------------------------------------
set.seed(257)

SIZE <- 15
condition <- as.factor(c(rep("group1", SIZE), rep("group2", SIZE), rep("group3", SIZE)))
covariate1 <- c(rnorm(SIZE, 0, 1), rnorm(SIZE, 0, 2), rnorm(SIZE, 1, 2))
covariate2 <- c(rnorm(SIZE, 0, 1), rnorm(SIZE, 0, 2), rnorm(SIZE, 1, 2))
covariates <- cbind(covariate1, covariate2)

## ------------------------------------------------------------------------
is.in <- match_groups(condition, covariates, t_ad_halt, method = "heuristic1")
print(table(condition, is.in))

