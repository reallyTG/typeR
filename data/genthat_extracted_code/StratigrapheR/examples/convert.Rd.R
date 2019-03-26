library(StratigrapheR)


### Name: convert
### Title: Converts x values having an index into n values defined by the
###   same y index
### Aliases: convert

### ** Examples

x      <- c(10,20)
xindex <- c(1,2)

n      <- seq(0.1,1,by = 0.1)
nindex <- 1:length(n)

convert(x,xindex,n,nindex)




