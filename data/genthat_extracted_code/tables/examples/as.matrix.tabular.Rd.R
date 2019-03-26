library(tables)


### Name: as.matrix.tabular
### Title: Convert tabular object to matrix
### Aliases: as.matrix.tabular

### ** Examples


table <-
    tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )

print(table)
as.matrix(table)
as.matrix(table, format=as.numeric)



