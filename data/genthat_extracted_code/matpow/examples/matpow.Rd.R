library(matpow)


### Name: matpow
### Title: Matrix Powers
### Aliases: matpow

### ** Examples

## Not run: 
##D m <- rbind(1:2,3:4)
##D ev <- matpow(m,16)
##D ev$prod1
##D # prints
##D #              [,1]        [,2]
##D # [1,] 115007491351 1.67615e+11
##D # [2,] 251422553235 3.66430e+11
##D 
##D ev$i  # prints 15
##D matpow(m,16,squaring=TRUE)$i  # prints 4, same prod1
## End(Not run)

# see further examples in the callbacks



