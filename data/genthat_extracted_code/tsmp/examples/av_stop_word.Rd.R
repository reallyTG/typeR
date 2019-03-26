library(tsmp)


### Name: av_stop_word
### Title: Computes the annotation vector that suppresses stop-word motifs
### Aliases: av_stop_word

### ** Examples

data <- mp_test_data$train$data[1:1000]
w <- 50
mp <- tsmp(data, window_size = w, verbose = 0)
av <- av_stop_word(mp, stop_word_loc = 150, apply = TRUE)




