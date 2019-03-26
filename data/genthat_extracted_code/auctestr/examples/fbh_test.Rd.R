library(auctestr)


### Name: fbh_test
### Title: Apply z-test for difference between auc_1 and auc_2 using FBH
###   method.
### Aliases: fbh_test

### ** Examples

## Two models with identical AUC return z-score of zero
fbh_test(0.56, 0.56, 1000, 2500)
## Compare two models; note that changing order changes sign of z-statistic
fbh_test(0.56, 0.59, 1000, 2500)
fbh_test(0.59, 0.56, 1000, 2500)



