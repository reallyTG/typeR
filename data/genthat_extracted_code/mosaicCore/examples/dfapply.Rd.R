library(mosaicCore)


### Name: dfapply
### Title: apply-type function for data frames
### Aliases: dfapply

### ** Examples

dfapply(iris, mean, select = is.numeric)
dfapply(iris, mosaic::favstats, select = c(TRUE, TRUE, FALSE, FALSE, FALSE))
dfapply(iris, mean, select = c(1,2))
dfapply(iris, mean, select = c("Sepal.Length", "Petal.Length"))
if (require(mosaicData)) {
  dfapply(HELPrct, table, select = is.factor)
  do.call(rbind, dfapply(HELPrct, mean, select = is.numeric))
}



