library(fuzzywuzzyR)


### Name: GetCloseMatches
### Title: Matches of character strings
### Aliases: GetCloseMatches

### ** Examples


if (check_availability()) {


  library(fuzzywuzzyR)

  vec = c('Frodo Baggins', 'Tom Sawyer', 'Bilbo Baggin')

  str1 = 'Fra Bagg'

  GetCloseMatches(string = str1, sequence_strings = vec, n = 2L, cutoff = 0.6)


}



