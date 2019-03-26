library(dtangle)


### Name: est_phats
### Title: Estimate the gene type proportions.
### Aliases: est_phats

### ** Examples

truth = shen_orr_ex$annotation$mixture
pure_samples <- lapply(1:3, function(i) {
   which(truth[, i] == 1)
})
Y <- shen_orr_ex$data$log
markers = find_markers(Y=Y,pure_samples = pure_samples,
data_type='microarray-gene',marker_method='ratio')$L
K = length(pure_samples)
n_markers = rep(20,K)
mrkrs <- lapply(1:K, function(i) {
       markers[[i]][1:n_markers[i]]
})
baseline = dtangle:::baseline_exprs(Y, pure_samples, mrkrs)
phats <- dtangle:::est_phats(Y, mrkrs, baseline, gamma=.8)



