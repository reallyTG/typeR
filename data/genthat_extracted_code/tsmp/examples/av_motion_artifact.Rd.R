library(tsmp)


### Name: av_motion_artifact
### Title: Computes the annotation vector that suppresses motion artifacts
### Aliases: av_motion_artifact

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
av <- av_motion_artifact(mp, apply = TRUE)




