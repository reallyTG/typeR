library(tsmp)


### Name: fluss_cac
### Title: FLUSS - Corrected Arc Counts
### Aliases: fluss_cac

### ** Examples

data <- mp_fluss_data$tilt_abp$data[1:1000]
w <- 10
mp <- tsmp(data, window_size = w, verbose = 0)
mp <- fluss_cac(mp)



