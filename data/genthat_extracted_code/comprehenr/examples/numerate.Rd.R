library(comprehenr)


### Name: numerate
### Title: Auxiliary functions for working with lists
### Aliases: numerate enumerate unnumerate mark unmark unzip_list zip_lists
###   lag_list

### ** Examples

cities = c('Chicago', 'Detroit', 'Atlanta')
airports = c('ORD', 'DTW', 'ATL')
pairs = zip_lists(cities, airports)

str(pairs)
str(unzip_list(pairs))

str(numerate(cities))

named_list = c('Chicago' = 'ORD', 'Detroit' = 'DTW', 'Atlanta' = 'ATL')
str(mark(named_list))

set.seed(123)
rand_sequence = runif(20)
# gives only locally increasing values
to_vec(for(`i, j` in lag_list(rand_sequence)) if(j>i) j)



