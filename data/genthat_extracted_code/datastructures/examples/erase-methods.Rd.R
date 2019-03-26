library(datastructures)


### Name: erase
### Title: Erase an entry from a map
### Aliases: erase erase,map,vector,missing-method
###   erase,bimap,missing,vector-method erase,multimap,vector,vector-method
###   erase,multimap,vector,list-method erase,multimap,vector,ANY-method

### ** Examples


 # erases keys from a hashmap or bimap
 h_map <- hashmap()
 h_map[letters] <- rnorm(length(letters))
 h_map <- erase(h_map, "a")
 h_map <- erase(h_map, letters[2:5])

 # erases keys from a multimap
 m_map <- multimap()
 m_map[c("a", "a", "a", "b", "b", "c")] <- rep(1:2, 3)
 m_map <- erase(m_map, "a")
 m_map <- erase(m_map, "b", 1)




