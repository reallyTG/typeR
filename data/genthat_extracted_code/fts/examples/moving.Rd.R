library(fts)


### Name: moving
### Title: Moving Functions
### Aliases: moving.functions moving.mean moving.sum moving.product
###   moving.max moving.min moving.sd moving.rank moving.cor moving.cov
###   cor.by.row
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=1:100)
y <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=1:100)

x.mean <- moving.mean(x,20)
x.sum <- moving.sum(x,20)
x.prod <- moving.product(x,20)
x.max <- moving.max(x,20)
x.min <- moving.min(x,20)
x.sd <- moving.sd(x,20)
x.rank <- moving.rank(x,20)

## take only odd rows
## to illustrate that teh correlation and covariance
## will only be calculated for the intersection of the dates
y <- y[(1:nrow(y))%%2 == 1]

xy.cor <- moving.cor(x, y, 20)
xy.cov <- moving.cov(x, y, 20)



