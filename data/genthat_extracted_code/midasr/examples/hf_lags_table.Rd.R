library(midasr)


### Name: hf_lags_table
### Title: Create a high frequency lag selection table for MIDAS regression
###   model
### Aliases: hf_lags_table

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

mlr <- hf_lags_table(y ~ trend + fmls(x, 12, 12,nealmon),
                     start = list(x=rep(0,3)),
                     data = list(y = y, x = x, trend = trend),
                     from=c(x=0),to=list(x=c(4,4)))
mlr




