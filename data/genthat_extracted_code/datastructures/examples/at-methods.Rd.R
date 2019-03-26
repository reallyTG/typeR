library(datastructures)


### Name: at
### Title: Access elements from an object
### Aliases: at at,bimap,vector,character-method
###   at,bimap,vector,missing-method at,unordered_map,vector,missing-method

### ** Examples


# access values from a hashmap
h_map <- hashmap("integer")
h_map[seq(2)] <- list(data.frame(a=rexp(3), b=rnorm(3)), environment())
h_map[1L]

# access values or keys from a bimap
b_map <- bimap("integer", "character")
b_map[seq(5)] <- letters[seq(5)]
at(b_map, c(1L, 3L))
at(b_map, c(1L, 3L), which="values")
at(b_map, c("a", "c"), which="keys")

# access values from a multimap
m_map <- multimap("integer")
m_map[c(seq(5), seq(5))] <- letters[seq(10)]
at(m_map, 1L)




