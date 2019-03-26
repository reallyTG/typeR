library(Dark)


### Name: Declutter
### Title: Declutter
### Aliases: Declutter
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(123)
Time  <-c(0, 0.02, 1, 2,  3, 3.02,  5, 6, 6.02, 7, 9, 9.02, 11, 
12, 12.02, 13, 15, 15.02, 16, 18, 18.02, 20) 
# with duplicated times
set.seed(1234)
tmp <- TestData(Time, sse=0.05) 
## Not run: plot(tmp$time, tmp$thrs, ylim=c(-4,0))
tmp <- Declutter(tmp)
## Not run: points(tmp$time, tmp$thrs, col='red', pch=16)




