library(midasr)


### Name: modsel
### Title: Select the model based on given information criteria
### Aliases: modsel

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

mhfr <- hf_lags_table(y~trend+fmls(x,12,12,nealmon),
                      start=list(x=rep(0,3)),
                      from=list(x=0),to=list(x=c(4,6)))

mlfr <- lf_lags_table(y~trend+fmls(x,12,12,nealmon),
                      start=list(x=rep(0,3)),
                      from=list(x=0),to=list(x=c(2,3)))

modsel(mhfr,"BIC","unrestricted")

modsel(mlfr,"BIC","unrestricted")




