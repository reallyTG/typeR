library(reclin)


### Name: tabulate_patterns
### Title: Create a table of comparison patterns
### Aliases: tabulate_patterns

### ** Examples

data("linkexample1", "linkexample2")
pairs <- pair_blocking(linkexample1, linkexample2, "postcode")
pairs <- compare_pairs(pairs, c("lastname", "firstname", "address", "sex"))
tabulate_patterns(pairs)

## Don't show: 
gc()
## End(Don't show)




