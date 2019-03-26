library(fts)


### Name: remove.rows
### Title: Remove Rows
### Aliases: remove.rows remove.na.rows remove.all.na.rows
### Keywords: ts

### ** Examples

x <- fts(index=seq(from=Sys.Date(),by="days",length.out=10),matrix(rnorm(20),ncol=2))

x[5,1] <- NA
x[10,] <- NA

print(x)

## will drop rows where NA's appear
## in any of the columns
remove.na.rows(x)

## will drop rows where NA's appear
## in all of the columns
remove.all.na.rows(x)



