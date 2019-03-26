library(rpf)


### Name: orderCompletely
### Title: Order a data.frame by missingness and all columns
### Aliases: orderCompletely

### ** Examples

df <- as.data.frame(matrix(c(sample.int(2, 30, replace=TRUE)), 10, 3))
mask <- matrix(c(sample.int(3, 30, replace=TRUE)), 10, 3) == 1
df[mask] <- NA
df[orderCompletely(df),]



