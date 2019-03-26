library(biogram)


### Name: calc_pi
### Title: Calculate partition index
### Aliases: calc_pi

### ** Examples

# calculate encoding distance between two encodings of amino acids
aa1 = list(`1` = c("g", "a", "p", "v", "m", "l", "i"), 
           `2` = c("k", "h"), 
           `3` = c("d", "e"), 
           `4` = c("f", "r", "w", "y", "s", "t", "c", "n", "q"))

aa2 = list(`1` = c("g", "a", "p", "v", "m", "l", "q"), 
           `2` = c("k", "h", "d", "e", "i"), 
           `3` = c("f", "r", "w", "y", "s", "t", "c", "n"))
calc_pi(aa1, aa2) 
    
# the encoding distance between two identical encodings is 0
calc_pi(aa1, aa1) 
 



