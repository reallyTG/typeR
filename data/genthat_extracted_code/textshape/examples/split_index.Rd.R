library(textshape)


### Name: split_index
### Title: Split Data Forms at Specified Indices
### Aliases: split_index split_index.list split_index.data.frame
###   split_index.matrix split_index.numeric split_index.factor
###   split_index.character split_index.default

### ** Examples

## character
split_index(LETTERS, c(4, 10, 16))
split_index(LETTERS, c(4, 10, 16), c("dog", "cat", "chicken", "rabbit"))

## numeric
split_index(1:100, c(33, 66))

## factor
(p_chng <- change_index(CO2[["Plant"]]))
split_index(CO2[["Plant"]], p_chng)
#`change_index` was unnecessary as it is the default of atomic vectors
split_index(CO2[["Plant"]])

## list
split_index(as.list(LETTERS), c(4, 10, 16))

## data.frame
(vs_change <- change_index(mtcars[["vs"]]))
split_index(mtcars, vs_change)

## matrix
(mat <- matrix(1:50, nrow=10))
split_index(mat, c(3, 6, 10))



