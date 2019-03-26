library(reclin)


### Name: score_simsum
### Title: Score pairs by summing the similarity vectors
### Aliases: score_simsum

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
pairs <- score_simsum(pairs)
 
## Don't show: 
gc()
## End(Don't show)




