library(dplR)


### Name: interseries.cor
### Title: Individual Series Correlation Against a Master Chronology
### Aliases: interseries.cor
### Keywords: manip

### ** Examples
library(utils)
data(gp.rwl)
foo <- interseries.cor(gp.rwl)
# compare to: 
# corr.rwl.seg(rwl=gp.rwl,make.plot=FALSE)$overall
# using pearson's r
foo <- interseries.cor(gp.rwl,method="pearson")

# two measures of interseries correlation
# compare interseries.cor to rbar from rwi.stats
gp.ids <- read.ids(gp.rwl, stc = c(0, 2, 1))
bar <- rwi.stats(gp.rwl, gp.ids, prewhiten=TRUE)
bar$rbar.eff
mean(foo[,1])




