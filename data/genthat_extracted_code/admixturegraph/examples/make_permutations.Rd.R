library(admixturegraph)


### Name: make_permutations
### Title: List of permutations.
### Aliases: make_permutations

### ** Examples

## No test: 
# The number of permutations of n elements is n!. Take 0! = 1, 1! = 1, 2! = 2
# and 3! = 6 for granted. Now we can estimate e:
FOUR <- length(make_permutations(c(1, 2, 3, 4)))
FIVE <- length(make_permutations(c(1, 2, 3, 4, 5)))
SIX <- length(make_permutations(c(1, 2, 3, 4, 5, 6)))
SEVEN <- length(make_permutations(c(1, 2, 3, 4, 5, 6, 7)))
EIGHT <- length(make_permutations(c(1, 2, 3, 4, 5, 6, 7, 8)))
1/1 + 1/1 + 1/2 + 1/6 + 1/FOUR + 1/FIVE + 1/SIX + 1/SEVEN + 1/EIGHT
# Hey that was pretty close!
## End(No test)




