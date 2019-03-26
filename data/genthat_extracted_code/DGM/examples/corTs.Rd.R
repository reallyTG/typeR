library(DGM)


### Name: corTs
### Title: Mean correlation of time series across subjects.
### Aliases: corTs

### ** Examples

# create some sample data with 200 samples,
# 5 nodes, and 2 subjects
ts = array(rnorm(200*5*2), dim=c(200,5,2))
M = corTs(ts)




