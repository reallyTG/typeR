library(tsmp)


### Name: av_apply
### Title: Corrects the matrix profile using an annotation vector
### Aliases: av_apply

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
mp <- av_complexity(mp)
av <- av_apply(mp)



