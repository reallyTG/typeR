library(reclin)


### Name: select_greedy
### Title: Select matching pairs enforcing one-to-one linkage
### Aliases: select_greedy select_n_to_m

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
pairs <- score_simsum(pairs)

# Select pairs with a simsum > 5 and force one-to-one linkage
pairs <- select_n_to_m(pairs, 0, var = "ntom")
pairs <- select_greedy(pairs, 0, var = "greedy")
table(pairs[c("ntom", "greedy")])

## Don't show: 
gc()
## End(Don't show)




