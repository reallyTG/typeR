library(rpf)


### Name: tabulateRows
### Title: Tabulate data.frame rows
### Aliases: tabulateRows

### ** Examples

df <- as.data.frame(matrix(c(sample.int(2, 30, replace=TRUE)), 10, 3))
df <- df[orderCompletely(df),]
tabulateRows(df)



