library(opusminer)


### Name: opus
### Title: Filtered Top-k Association Discovery of Self-Sufficient Itemsets
### Aliases: opus

### ** Examples

## Not run: 
##D 
##D result <- opus("mushroom.dat")
##D result <- opus("mushroom.dat", k = 50)
##D 
##D result[result$self_sufficient, ]
##D result[order(result$count, decreasing = TRUE), ]
##D 
##D trans <- read_transactions("mushroom.dat", format = "transactions")
##D 
##D result <- opus(trans, print_closures = TRUE)
##D result <- opus(trans, format = "itemsets")
## End(Not run)



