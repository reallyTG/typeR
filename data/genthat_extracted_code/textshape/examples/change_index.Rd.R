library(textshape)


### Name: change_index
### Title: Indexing of Changes in Runs
### Aliases: change_index

### ** Examples

set.seed(10)
(x <- sample(0:1, 20, TRUE))
change_index(x)
split_index(x, change_index(x))


(p_chng <- change_index(CO2[["Plant"]]))
split_index(CO2[["Plant"]], p_chng)



