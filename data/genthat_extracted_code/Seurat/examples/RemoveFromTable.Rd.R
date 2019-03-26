library(Seurat)


### Name: RemoveFromTable
### Title: Remove data from a table
### Aliases: RemoveFromTable

### ** Examples

df <- data.frame(
  x = rnorm(n = 100, mean = 20, sd = 2),
  y = rbinom(n = 100, size = 100, prob = 0.2)
)
nrow(x = df)
nrow (x = RemoveFromTable(to.remove = 20, data = df))




