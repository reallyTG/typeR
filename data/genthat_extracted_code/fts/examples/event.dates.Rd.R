library(fts)


### Name: event.dates
### Title: Extract Dates
### Aliases: event.dates
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=rnorm(100))
x.bool <- x > 10
event.dates(x.bool)

## ignores NA's
x.bool[10:20] <- NA
event.dates(x.bool)




