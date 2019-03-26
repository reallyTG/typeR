library(CommonTrend)


### Name: Kasa.ComT
### Title: Common Trend(s) according to Kasa(1992)
### Aliases: Kasa.ComT
### Keywords: Common-Trend

### ** Examples

 
 data(benchmark)
 x=seq(1,6689,by=23) ## monthly data
 global=data.frame(benchmark[x,2:4])
 
 Kasa.ComT (global,2,4)
 
 ## Plot the Common Trend

 K=GG.ComT (global,2,4)

 Date=benchmark[x,1]
 plotComT(K,1,x.axis=Date,approx.ticks=12,
         legend=c("S&P 500 Price index", "Common Trend"),
         main="Extract Common Trend(s) from Benchmark Markets",
         ylab="Price", xlab="Time"  )
 



