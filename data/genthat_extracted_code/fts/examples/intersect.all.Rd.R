library(fts)


### Name: intersect.all
### Title: find date intersection among multiple fts objects
### Aliases: intersect.all
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=1:100)
y <- fts(index=seq(from=Sys.Date(),by="days",length.out=100),data=1:100)
y <- y[1:nrow(y) %% 2==0,]
intersect.all(x,y)



