library(dtangle)


### Name: find_markers
### Title: Find marker genes for each cell type.
### Aliases: find_markers

### ** Examples

truth = shen_orr_ex$annotation$mixture
pure_samples <- lapply(1:3, function(i) {
   which(truth[, i] == 1)
})
Y <- shen_orr_ex$data$log
find_markers(Y=Y,pure_samples=pure_samples,
data_type='microarray-gene',marker_method='ratio')



