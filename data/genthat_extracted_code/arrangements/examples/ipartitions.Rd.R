library(arrangements)


### Name: Partitions
### Title: Partitions iterator
### Aliases: Partitions ipartitions
### Keywords: datasets

### ** Examples

ipart <- ipartitions(10)
ipart$getnext()
ipart$getnext(2)
ipart$getnext(layout = "column", drop = FALSE)
# collect remaining partitions
ipart$collect()

library(foreach)
foreach(x = ipartitions(6, 2), .combine=c) %do% {
  prod(x)
}



