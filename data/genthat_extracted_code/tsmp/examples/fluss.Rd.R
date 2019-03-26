library(tsmp)


### Name: fluss
### Title: Fast Low-cost Unipotent Semantic Segmentation (FLUSS)
### Aliases: fluss

### ** Examples

data <- mp_fluss_data$tilt_abp$data[1:1000]
w <- 10
mp <- tsmp(data, window_size = w, verbose = 0)
mp <- fluss(mp, 2)



