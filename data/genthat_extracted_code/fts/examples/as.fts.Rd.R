library(fts)


### Name: as.fts
### Title: Convert from/to fts
### Aliases: as.fts as.fts.default as.fts.data.frame as.fts.matrix
###   as.fts.zoo as.data.frame.fts as.matrix.fts
### Keywords: ts

### ** Examples

N <- 100
xm <- matrix(rnorm(N))
dts <- format(seq(from=Sys.Date(),length.out=N,by="days"),"%Y-%m-%d")
rownames(xm) <- dts
x.from.m <- as.fts(xm)
x.from.df <- as.fts(data.frame(asofdate=dts,my.data=xm))



