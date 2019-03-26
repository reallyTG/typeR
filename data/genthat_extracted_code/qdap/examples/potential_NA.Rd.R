library(qdap)


### Name: potential_NA
### Title: Search for Potential Missing Values
### Aliases: potential_NA

### ** Examples

## Not run: 
##D DATA$state[c(3, 7)] <- "."
##D potential_NA(DATA$state, 20)
##D potential_NA(DATA$state)
##D # USE TO SELCTIVELY REPLACE CELLS WITH MISSING VALUES
##D DATA$state[potential_NA(DATA$state, 20)$row[-c(3)]] <- NA
##D DATA
##D DATA <- qdap::DATA
## End(Not run)



