library(qdapTools)


### Name: loc_split
### Title: Split Data Forms at Specified Locations
### Aliases: loc_split loc_split.list loc_split.data.frame loc_split.matrix
###   loc_split.numeric loc_split.factor loc_split.character
###   loc_split.default

### ** Examples

## character
loc_split(LETTERS, c(4, 10, 16))
loc_split(LETTERS, c(4, 10, 16), c("dog", "cat", "chicken", "rabbit"))

## numeric
loc_split(1:100, c(33, 66))

## factor
(p_chng <- head(1 + cumsum(rle(as.character(CO2[["Plant"]]))[[1]]), -1))
loc_split(CO2[["Plant"]], p_chng)

## list
loc_split(as.list(LETTERS), c(4, 10, 16))

## data.frame
(vs_change <- head(1 + cumsum(rle(as.character(mtcars[["vs"]]))[[1]]), -1))
loc_split(mtcars, vs_change)

## matrix
(mat <- matrix(1:50, nrow=10))
loc_split(mat, c(3, 6, 10))



