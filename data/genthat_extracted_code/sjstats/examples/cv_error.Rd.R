library(sjstats)


### Name: cv_error
### Title: Test and training error from model cross-validation
### Aliases: cv_error cv_compare

### ** Examples

data(efc)
cv_error(efc, neg_c_7 ~ barthtot + c161sex)

cv_compare(efc, formulas = list(
  neg_c_7 ~ barthtot + c161sex,
  neg_c_7 ~ barthtot + c161sex + e42dep,
  neg_c_7 ~ barthtot + c12hour
))




