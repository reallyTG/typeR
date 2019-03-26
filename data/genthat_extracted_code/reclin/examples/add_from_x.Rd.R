library(reclin)


### Name: add_from_x
### Title: Add variables from data sets to pairs
### Aliases: add_from_x add_from_y

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
pairs <- add_from_x(pairs, id_x = "id")
pairs <- add_from_y(pairs, id_y = "id")
pairs$true_match <- pairs$id_x == pairs$id_y

## Don't show: 
gc()
## End(Don't show)




