library(midasr)


### Name: midas_r_ic_table
### Title: Create a weight and lag selection table for MIDAS regression
###   model
### Aliases: midas_r_ic_table

### ** Examples


data("USunempr")
data("USrealgdp")
y <- diff(log(USrealgdp))
x <- window(diff(USunempr),start=1949)
trend <- 1:length(y)

 
mwlr <- midas_r_ic_table(y~trend+fmls(x,12,12,nealmon),
                   table=list(x=list(weights=
                   as.list(c("nealmon","nealmon","nbeta")),
                   lags=list(0:4,0:5,0:6),
                   starts=list(rep(0,3),rep(0,3,),c(1,1,1,0)))))

mwlr




