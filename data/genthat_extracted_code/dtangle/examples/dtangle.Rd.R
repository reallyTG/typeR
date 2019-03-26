library(dtangle)


### Name: dtangle
### Title: Deconvolve cell type mixing proportions from gene expression
###   data.
### Aliases: dtangle

### ** Examples

truth = shen_orr_ex$annotation$mixture
pure_samples <- lapply(1:3, function(i) {
   which(truth[, i] == 1)
})
Y <- shen_orr_ex$data$log
n_markers = 20

dtangle(Y, pure_samples = pure_samples,
n_markers=n_markers,data_type='microarray-gene',marker_method = 'ratio')

n_markers = c(10,11,12)
dtangle(Y, pure_samples=pure_samples,
n_markers=n_markers,gamma=.8,marker_method = 'regression')



