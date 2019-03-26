library(fts)


### Name: pad
### Title: pad and trim dates
### Aliases: pad.trim pad trim filter.min.obs
### Keywords: ts

### ** Examples


x <- fts(index=seq(from=Sys.Date(),by="days",length.out=5),data=1:5)
pad.dates <- index(x)[1] + c(10L,20L)
pad(x,pad.dates)

trim.dts <- index(x)[c(1,3)]

trim(x,trim.dts)



