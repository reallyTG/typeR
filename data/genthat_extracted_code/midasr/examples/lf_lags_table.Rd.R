library(midasr)


### Name: lf_lags_table
### Title: Create a low frequency lag selection table for MIDAS regression
###   model
### Aliases: lf_lags_table

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

mlr <- lf_lags_table(y~trend+fmls(x,12,12,nealmon),
                     start=list(x=rep(0,3)),
                     from=c(x=0),to=list(x=c(3,4)))
mlr




