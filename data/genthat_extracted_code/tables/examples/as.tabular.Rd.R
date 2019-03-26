library(tables)


### Name: as.tabular
### Title: Convert matrix or dataframe to tabular object.
### Aliases: as.tabular as.tabular.default as.tabular.data.frame
### Keywords: ~kwd1 ~kwd2

### ** Examples

model <- tabular( (Species + 1) ~ (n=1) + Sepal.Length + Sepal.Width, data=iris )
model
as.tabular(matrix(1:12, 4,3), like=model)



