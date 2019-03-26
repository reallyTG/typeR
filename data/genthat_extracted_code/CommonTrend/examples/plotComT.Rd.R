library(CommonTrend)


### Name: plotComT
### Title: Plot the common trend(s)
### Aliases: plotComT
### Keywords: plot

### ** Examples


data(benchmark)
x=seq(1,6689,by=23) ## monthly data
global=data.frame(benchmark[x,2:4])
Date=benchmark[x,1]
 
G=GG.ComT (global,2,4)

## only the first two arguments in this function are compulsory.

plotComT(G,1) 

## The complete set of arguments
 
plotComT(G,1,x.axis=Date,approx.ticks=12,
         legend=c("S&P 500 Price index", "Common Trend"),
         main="Extract Common Trend(s) from Benchmark Markets according to GG",
         ylab="Price", xlab="Time"  )
 



