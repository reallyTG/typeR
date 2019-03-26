library(CommonTrend)


### Name: GG.ComT
### Title: Permanent-Transitory Decomposition
### Aliases: GG.ComT
### Keywords: Permanent-Transitory Decomposition

### ** Examples

 
 data(benchmark)
 x=seq(1,6689,by=23) ## monthly data
 global=data.frame(benchmark[x,2:4])
 
 GG.ComT (global,2,4)
 
 ## Plot the Common Trend

 G=GG.ComT (global,2,4)
 Date=benchmark[x,1]
 plotComT(G,1,x.axis=Date,approx.ticks=12,
         legend=c("S&P 500 Price index", "Common Trend"),
         main="Extract Common Trend(s) from Benchmark Markets",
         ylab="Price", xlab="Time"  )
 



