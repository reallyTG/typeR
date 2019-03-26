library(tsmp)


### Name: sdts_predict
### Title: Framework for Scalable Dictionary learning for Time Series
###   (SDTS) prediction function
### Aliases: sdts_predict

### ** Examples

# This is a fast toy example and results are useless. For a complete result, run the code inside
#'Not run' section below.
w <- c(110, 220)
subs <- 11000:20000
tr_data <- mp_test_data$train$data[subs]
tr_label <- mp_test_data$train$label[subs]
te_data <- mp_test_data$test$data[subs]
te_label <- mp_test_data$test$label[subs]
model <- sdts_train(tr_data, tr_label, w, verbose = 0)
predict <- sdts_predict(model, te_data, round(mean(w)))
sdts_score(predict, te_label, 1)

## Not run: 
##D windows <- c(110, 220, 330)
##D model <- sdts_train(mp_test_data$train$data, mp_test_data$train$label, windows, verbose = 0)
##D predict <- sdts_predict(model, mp_test_data$test$data, round(mean(windows)))
##D sdts_score(predict, mp_test_data$test$label, 1)
## End(Not run)



