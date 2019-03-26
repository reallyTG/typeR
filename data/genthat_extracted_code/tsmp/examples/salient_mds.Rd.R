library(tsmp)


### Name: salient_mds
### Title: Convert salient sequences into MDS space
### Aliases: salient_mds

### ** Examples

# toy example
data <- mp_toy_data$data[, 1]
mp <- tsmp(data, window_size = 30, verbose = 0)
mps <- salient_subsequences(mp, verbose = 0)
mds_data <- salient_mds(mps)
plot(mds_data, main = "Multi dimensional scale")



