library(quanteda)


### Name: pattern
### Title: Pattern for feature, token and keyword matching
### Aliases: pattern
### Keywords: internal

### ** Examples

# these are interpreted literally
(patt1 <- c('president', 'white house', 'house of representatives'))
# as multi-word sequences
phrase(patt1)

# three single-word patterns
(patt2 <- c('president', 'white_house', 'house_of_representatives'))
phrase(patt2)

# this is equivalent to phrase(patt1)
(patt3 <- list(c('president'), c('white', 'house'), c('house', 'of', 'representatives')))

# glob expression can be used 
phrase(patt4 <- c('president?', 'white house', 'house * representatives'))

# this is equivalent to phrase(patt4)
(patt5 <- list(c('president?'), c('white', 'house'), c('house', '*', 'representatives')))

# dictionary with multi-word matches
(dict1 <- dictionary(list(us = c('president', 'white house', 'house of representatives'))))
phrase(dict1)



