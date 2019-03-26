library(qdapTools)


### Name: lookup
### Title: Hash Table/Dictionary Lookup 'lookup' - 'data.table' based hash
###   table useful for large vector lookups.
### Aliases: lookup lookup.list lookup.data.frame lookup.matrix
###   lookup.numeric lookup.factor lookup.character %l% %l+% %lc% %lc+%
### Keywords: dictionary, hash, lookup

### ** Examples

## Supply a dataframe to key.match

lookup(1:5, data.frame(1:4, 11:14))

## Retain original values for missing 
lookup(1:5, data.frame(1:4, 11:14), missing=NULL) 

lookup(LETTERS[1:5], data.frame(LETTERS[1:5], 100:104))
lookup(LETTERS[1:5], factor(LETTERS[1:5]), 100:104)

## Supply a named list of vectors to key.match

codes <- list(
    A = c(1, 2, 4), 
    B = c(3, 5),
    C = 7,
    D = c(6, 8:10)
)

lookup(1:10, codes)

## Supply a single vector to key.match and key.reassign

lookup(mtcars$carb, sort(unique(mtcars$carb)),        
    c("one", "two", "three", "four", "six", "eight")) 
    
lookup(mtcars$carb, sort(unique(mtcars$carb)),        
    seq(10, 60, by=10))
  
## %l%, a binary operator version of lookup
1:5 %l% data.frame(1:4, 11:14)
1:10 %l% codes

1:12 %l% codes
1:12 %l+% codes
  
(key <- data.frame(a=1:3, b=factor(paste0("l", 1:3))))
1:3 %l% key

##Larger Examples
key <- data.frame(x=1:2, y=c("A", "B"))
big.vec <- sample(1:2, 3000000, TRUE)
out <- lookup(big.vec, key)
out[1:20]

## A big string to recode with variation
## means a bigger dictionary
recode_me <- sample(1:(length(LETTERS)*10), 10000000, TRUE)

## Time it
tic <- Sys.time()  

output <- recode_me %l% split(1:(length(LETTERS)*10), LETTERS)
difftime(Sys.time(), tic)

## view it
sample(output, 100)



