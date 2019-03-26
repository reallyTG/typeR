library(tsmp)


### Name: fluss_extract
### Title: FLUSS - Extract Segments
### Aliases: fluss_extract

### ** Examples

data <- mp_fluss_data$tilt_abp$data[1:1000]
w <- 10
mp <- tsmp(data, window_size = w, verbose = 0)
mp <- fluss_cac(mp)
mp <- fluss_extract(mp, 2)



