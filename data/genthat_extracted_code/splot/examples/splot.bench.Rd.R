library(splot)


### Name: splot.bench
### Title: splot benchmarker
### Aliases: splot.bench

### ** Examples

# compare a few equivalent ways of looping through a vector
# though you'd probably need to increase the number of runs
# for a consistent determination

splot.bench(
  sapply(1:100,'*',10),
  mapply('*',1:100,10),
  vapply(1:100,'*',0,10),
  unlist(lapply(1:100,'*',10)),
  {a=numeric(100); for(i in 1:100) a[i]=i*10; a}
)



