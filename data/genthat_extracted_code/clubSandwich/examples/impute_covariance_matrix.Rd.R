library(clubSandwich)


### Name: impute_covariance_matrix
### Title: Impute a block-diagonal covariance matrix
### Aliases: impute_covariance_matrix

### ** Examples

library(metafor)
data(SATcoaching)
V_list <- impute_covariance_matrix(vi = SATcoaching$V, cluster = SATcoaching$study, r = 0.66)
MVFE <- rma.mv(d ~ 0 + test, V = V_list, data = SATcoaching)
coef_test(MVFE, vcov = "CR2", cluster = SATcoaching$study)




