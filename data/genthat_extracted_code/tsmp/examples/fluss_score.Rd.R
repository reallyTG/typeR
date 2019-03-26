library(tsmp)


### Name: fluss_score
### Title: FLUSS - Prediction score calculation
### Aliases: fluss_score

### ** Examples

data <- mp_fluss_data$tilt_abp$data[1:1000]
w <- 10
truth <- c(945, 875)
mp <- tsmp(data, window_size = w, verbose = 0)
mp <- fluss_cac(mp)
mp <- fluss_extract(mp, 2)
score <- fluss_score(truth, mp$fluss, length(data))



