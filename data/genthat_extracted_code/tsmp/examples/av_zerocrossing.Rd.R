library(tsmp)


### Name: av_zerocrossing
### Title: Computes the annotation vector that favors number of zero
###   crossing
### Aliases: av_zerocrossing

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
av <- av_zerocrossing(mp, apply = TRUE)




