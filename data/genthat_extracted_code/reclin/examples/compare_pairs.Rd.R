library(reclin)


### Name: compare_pairs
### Title: Compare all pairs of records
### Aliases: compare_pairs

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))

## Don't show: 
gc()
## End(Don't show)




