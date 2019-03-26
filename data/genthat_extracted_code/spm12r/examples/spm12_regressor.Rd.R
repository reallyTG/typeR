library(spm12r)


### Name: spm12_regressor
### Title: Build Regressors for SPM12 first level model
### Aliases: spm12_regressor spm12_regressor_list

### ** Examples

res = spm12_regressor(name = "condition1", value = c(
rep(1, 10), rep(0, 10)), n_time_points = 20)
print(res)
L = list(
cond1 = list(value = c(rep(1, 10), rep(0, 10)), n_time_points = 20),
cond2 = list(value = c(rep(0, 10), rep(1, 10)), n_time_points = 20)
)
res = spm12_regressor_list(L, n_time_points = 20)
print(res)



