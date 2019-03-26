library(ggfortify)


### Name: rbind_ts
### Title: Rbind original and predicted time-series-like instances as
###   fortified 'data.frame'
### Aliases: rbind_ts

### ** Examples

predicted <- predict(stats::HoltWinters(UKgas), n.ahead = 5, prediction.interval = TRUE)
rbind_ts(predicted, UKgas, ts.connect = TRUE)



