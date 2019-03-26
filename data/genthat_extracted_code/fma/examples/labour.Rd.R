library(fma)


### Name: labour
### Title: Civilian labour force
### Aliases: labour
### Keywords: datasets

### ** Examples
plot(labour)
labour.stl <- stl(labour,10)
plot(labour.stl)
monthplot(labour.stl$time.series[,1],type="h")



