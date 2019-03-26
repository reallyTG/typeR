library(fts)


### Name: fts
### Title: Fts: a fast timeseries library
### Aliases: fts Ops.fts [.fts [<-.fts cbind.fts rbind.fts print.fts
###   plot.fts
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="months",length.out=24),data=1:24)
y <- fts(index=seq(from=Sys.Date(),by="months",length.out=12),data=13:24)
xx <- x[1:10,]

## intersection of dates is taken for Arith methods
xyp <- x + y
xys <- x - y
xym <- x * y
xyd <- x / y
xyg <- x > y
xyl <- x < y

cxy <- cbind(x,y)
rxy <- rbind(x,y)
print(x)
plot(x)



