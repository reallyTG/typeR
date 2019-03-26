library(caschrono)


### Name: csdl
### Title: French stock and returns
### Aliases: csdl
### Keywords: datasets

### ** Examples

if(require("timeSeries")){
data(csdl)
# we create then the returns
aa = returns(csdl, percentage = TRUE)
aab <- aa[complete.cases(aa) == TRUE,]
# in previous version we use package its which will not be maintained anymore
# r.csdl = its(aab, as.POSIXct(row.names(aab)))
r.csdl = zoo(aab, as.POSIXct(row.names(aab)))
}



