library(fts)


### Name: apply
### Title: Apply Function
### Aliases: apply row.apply column.apply
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="months",length.out=24),data=1:24)
y <- fts(index=seq(from=Sys.Date(),by="months",length.out=24),data=1:24)

z <- cbind(x,y)

## returns vector
z.col.sum <- column.apply(z,sum)

## returns fts
z.row.sum <- row.apply(z,sum)




