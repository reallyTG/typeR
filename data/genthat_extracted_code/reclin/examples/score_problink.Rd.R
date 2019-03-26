library(reclin)


### Name: score_problink
### Title: Score comparison patterns of pairs using the probabilistic
###   linkage framework
### Aliases: score_problink

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
pairs <- score_problink(pairs)

# is the same as
model <- problink_em(pairs)
pairs <- score_problink(pairs, model = model)

## Don't show: 
gc()
## End(Don't show)




