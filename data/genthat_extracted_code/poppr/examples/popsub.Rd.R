library(poppr)


### Name: popsub
### Title: Subset data by population
### Aliases: popsub

### ** Examples

# Load the dataset microbov.
data(microbov)

# List the population names.
popNames(microbov)

# Analyze only the populations with exactly 50 individuals
mic.50 <- popsub(microbov, sublist=c(1:6, 11:15), blacklist=c(3,4,13,14))

## Not run: 
##D # Analyze the first 10 populations, except for "Bazadais"
##D mic.10 <- popsub(microbov, sublist=1:10, blacklist="Bazadais")
##D 
##D # Take out the two smallest populations
##D micbig <- popsub(microbov, blacklist=c("NDama", "Montbeliard"))
##D 
##D # Analyze the two largest populations
##D miclrg <- popsub(microbov, sublist=c("BlondeAquitaine", "Charolais"))
## End(Not run)



