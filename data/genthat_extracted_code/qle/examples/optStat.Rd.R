library(qle)


### Name: Subset of statistics
### Title: Optimal subset selection of statistics
### Aliases: 'Subset of statistics' optStat

### ** Examples

 data(normal)
 # must select all statistics and thus using the
 # full information since we only have to statistics available 
 optStat(c("mu"=2,"sigma"=1),qsd,kmax=2)[[1]]




