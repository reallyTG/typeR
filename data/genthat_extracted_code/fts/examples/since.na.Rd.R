library(fts)


### Name: since.na
### Title: Count distance since an NA has occurred
### Aliases: since.na
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),rnorm(100))

x[10,] <- NA

since.na(x)



