library(tsmp)


### Name: av_complexity
### Title: Computes the annotation vector that favors complexity
### Aliases: av_complexity

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
av <- av_complexity(mp, apply = TRUE)




