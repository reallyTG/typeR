library(BMisc)


### Name: ids2rownum
### Title: ids2rownum
### Aliases: ids2rownum

### ** Examples

ids <- seq(1,1000,length.out=100)
ids <- ids[order(runif(100))]
df <- data.frame(id=ids)
ids2rownum(df$id, df, "id")




