library(qdapTools)


### Name: hash
### Title: Hash/Dictionary Lookup
### Aliases: hash hash_look %hl% %hl+% hash_e
### Keywords: dictionary, hash, lookup

### ** Examples

##===================##
## data.table Hashes ##
##===================##
(DF <- aggregate(mpg~as.character(carb), mtcars, mean))
x <- sample(DF[, 1], 20, TRUE)
new.hash <- hash(DF) 
x2 <- c(9, 12, x)
hash_look(x, new.hash)

x %hl% new.hash
x2 %hl% new.hash
x2 %hl+% new.hash

## Create generic functions
hfun <- function(x, ...) {
    hsh <- hash(x, ...)
    function(x, ...) hash_look(x, hsh, ...)
}

m <- hfun(DF)
m(x)

##====================##
## Environment Hashes ##
##====================##
new.hash2 <- hash_e(DF)

x %hl% new.hash2
x2 %hl% new.hash2
x2 %hl+% new.hash2



