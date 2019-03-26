library(stapler)


### Name: staple_bin_mat
### Title: STAPLE on binary matrix
### Aliases: staple_bin_mat

### ** Examples

n = 5
r = 1000
sens = c(0.8, 0.9, 0.8, 0.5, 0.8)
spec = c(0.9, 0.75, 0.99, 0.98, 0.92)
set.seed(20171120)
n_1 = 200
n_0 = r - n_1
truth = c(rep(0, n_0), rep(1, n_1))
pred_1 = rbinom(n = n, size = n_1, prob = sens)
pred_0 = rbinom(n = n, size = n_0, prob = spec)
pred_0 = sapply(pred_0, function(n) {
   sample(c(rep(0, n), rep(1, n_0 -n)))
})
pred_1 = sapply(pred_1, function(n) {
   sample(c(rep(1, n), rep(0, n_1 -n)))
})
pred = rbind(pred_0, pred_1)
true_sens = colMeans(pred[ truth == 1, ])
true_spec = colMeans(1-pred[ truth == 0, ])
x = t(pred)
staple_out = staple_bin_mat(x)
staple_out_prior = staple_bin_mat(x, prior = rep(0.5, r))




