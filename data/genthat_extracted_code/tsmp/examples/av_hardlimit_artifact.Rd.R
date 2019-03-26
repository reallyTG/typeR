library(tsmp)


### Name: av_hardlimit_artifact
### Title: Computes the annotation vector that suppresses hard-limited
###   artifacts
### Aliases: av_hardlimit_artifact

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
av <- av_hardlimit_artifact(mp, apply = TRUE)




