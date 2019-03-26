library(datastructures)


### Name: keys
### Title: Get keys from an object
### Aliases: keys keys,bimap-method keys,unordered_map-method

### ** Examples


 # returns the keys of a hashmap
 h_map <- hashmap("numeric")
 h_map[rnorm(3)] <- list(1, 2, 3)
 keys(h_map)

 # returns the keys of a multimap
 m_map <- multimap("numeric")
 m_map[c(1, 2, 1)] <- list(rnorm(1), rgamma(1, 1), rexp(1))
 keys(m_map)




