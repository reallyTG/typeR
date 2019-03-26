library(esc)


### Name: effect_sizes
### Title: Generate effect size data frame from other data
### Aliases: effect_sizes

### ** Examples

tmp <- data.frame(
  tvalue = c(3.3, 2.9, 2.3),
  n = c(250, 200, 210),
  studyname = c("Study 1", "Study 2", "Study 3")
)
effect_sizes(tmp, t = tvalue, totaln = n, study = studyname, fun = "esc_t")

# missing effect size results are dropped,
# shorter function name, calls "esc_t()"
tmp <- data.frame(
  tvalue = c(3.3, 2.9, NA, 2.3),
  n = c(250, 200, 210, 210),
  studyname = c("Study 1", "Study 2", NA, "Study 4")
)
effect_sizes(tmp, t = tvalue, totaln = n, study = studyname, fun = "t")


tmp <- data.frame(
  coefficient = c(0.4, 0.2, 0.6),
  se = c(.15, .1, .2),
  treat = c(50, 60, 50),
  cntrl = c(45, 70, 40),
  author = c("Smith 2000", "Smith 2010 2", "Smith 2012")
)
effect_sizes(tmp, beta = coefficient, sdy = se, grp1n = treat, grp2n = cntrl,
    study = author, fun = "esc_beta", es.type = "or")

# the "esc_chisq" function requires *either* the chisq-argument *or*
# the pval-argument. If at least one of these values is present,
# effect size can be calculated. You can specify both arguments,
# and the first non-missing required value from "data" is taken.
tmp <- data.frame(
  chisqquared = c(NA, NA, 3.3, NA, 2.9),
  pval = c(.003, .05, NA, .12, NA),
  n = c(250, 200, 210, 150, 180),
  studyname = c("Study 1", "Study 2", "Study 3", "Study 4", "Study 5")
)
effect_sizes(tmp, chisq = chisqquared, p = pval, totaln = n,
             study = studyname, fun = "esc_chisq")

# if all required information are missing, data will be removed
tmp <- data.frame(
  chisqquared = c(NA, NA, 3.3, NA, NA),
  pval = c(.003, .05, NA, .12, NA),
  n = c(250, 200, 210, 150, 180),
  studyname = c("Study 1", "Study 2", "Study 3", "Study 4", "Study 5")
)
effect_sizes(tmp, chisq = chisqquared, p = pval, totaln = n,
             study = studyname, fun = "chisq")





