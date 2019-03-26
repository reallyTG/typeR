library(reclin)


### Name: select_threshold
### Title: Select pairs for linkage using a threshold
### Aliases: select_threshold

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
pairs <- score_simsum(pairs)
# Select pairs with a simsum > 5 as matches
pairs <- select_threshold(pairs, 5)

## Don't show: 
gc()
## End(Don't show)




