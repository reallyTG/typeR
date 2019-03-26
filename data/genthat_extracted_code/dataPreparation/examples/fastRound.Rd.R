library(dataPreparation)


### Name: fastRound
### Title: Fast round
### Aliases: fastRound

### ** Examples

# First let's build a very large data.table with random numbers
require(data.table)
M <- as.data.table(matrix(runif (3e4), ncol = 10))

M_rouded <- fastRound(M, 2)
# Lets add some character
M[, stringColumn := "a string"] 

# And use our function
M_rouded <- fastRound(M, 2)
# It still work :) and you don't have to worry about the string.



