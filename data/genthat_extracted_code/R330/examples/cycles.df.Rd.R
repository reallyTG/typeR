library(R330)


### Name: cycles.df
### Title: Cycles to failure of worsted yarn
### Aliases: cycles.df
### Keywords: datasets

### ** Examples

data(cycles.df)
library(lattice)
dotplot(cycles~yarn.length|amplitude*load,xlab="Yarn length",
 ylab="Cycles to failure",data=cycles.df,
strip=function(...)strip.default(...,strip.names=TRUE))



