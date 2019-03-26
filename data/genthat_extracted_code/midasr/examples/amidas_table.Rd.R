library(midasr)


### Name: amidas_table
### Title: Weight and lag selection table for aggregates based MIDAS
###   regression model
### Aliases: amidas_table

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

tb <- amidas_table(y~trend+fmls(x,12,12,nealmon),
                   data=list(y=y,x=x,trend=trend),
                   weights=c("nealmon"),wstart=list(nealmon=c(0,0,0)),
                   start=list(trend=1),type=c("A"),
                   from=0,to=c(1,2))





