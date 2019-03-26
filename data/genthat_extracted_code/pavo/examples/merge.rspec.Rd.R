library(pavo)


### Name: merge.rspec
### Title: Merge two rspec objects
### Aliases: merge.rspec

### ** Examples

## Not run: 
##D 
##D # Load and split dataset into 2 sections
##D data(teal)
##D teal1 <- teal[, c(1, 3:5)]
##D teal2 <- teal[, c(1, 2, 6:12)]
##D teal.mer <- merge(teal1, teal2, by = 'wl')
##D head(teal.mer)
##D par(mfrow = c(1, 2))
##D plot(teal.mer)
##D plot(teal)
##D 
## End(Not run)




