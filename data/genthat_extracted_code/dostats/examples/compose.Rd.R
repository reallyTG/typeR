library(dostats)


### Name: compose
### Title: Nest functions
### Aliases: %.% compose composition nest
### Keywords: misc utilities,

### ** Examples

compose(any, is.na)(c(NA,1:3))
(sum%.%is.na)(c(1,NA))  #correct
## Not run: 
##D sum%.%is.an(NA)  #incorrect
## End(Not run)



