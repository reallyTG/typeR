library(reclin)


### Name: problink_em
### Title: Calculate EM-estimates of m- and u-probabilities
### Aliases: problink_em

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
model <- problink_em(pairs)
summary(model)

## Don't show: 
gc()
## End(Don't show)




