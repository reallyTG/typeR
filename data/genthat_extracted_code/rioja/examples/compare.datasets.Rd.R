library(rioja)


### Name: compare.datasets
### Title: Compare datasets for matching variables (species)
### Aliases: compare.datasets plot.compare.datasets
### Keywords: utilities

### ** Examples

# compare diatom data from core from Round Loch of Glenhead
# with SWAP surface sample dataset
data(RLGH)
data(SWAP)
result <- compare.datasets(RLGH$spec, SWAP$spec)
result




