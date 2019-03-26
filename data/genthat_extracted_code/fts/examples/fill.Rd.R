library(fts)


### Name: fill
### Title: Fill Missing Values
### Aliases: fill fill.fwd fill.bwd fill.value
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=50),rnorm(50))
x[x > 0,] <- NA
fill.fwd(x)

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=50),rnorm(50))
x[x > 0,] <- NA
fill.bwd(x)

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=50),rnorm(50))
x[x > 0,] <- NA
fill.value(x,100.0)



