library(container)


### Name: Dict
### Title: A Dict class
### Aliases: Dict
### Keywords: datasets

### ** Examples

ages <- Dict$new(c(Peter=24, Lisa=23, Bob=32))
ages$has("Peter")   # TRUE
ages$peek("Lisa")   # 23
ages$peek("Mike")   # NULL
ages$add("Mike", 18)
ages$peek("Mike")   # 18
ages$keys()
print(ages)

## Not run: 
##D Dict$new(list(Peter=20))$add("Peter", 22)         # key already in Dict
##D Dict$new(c(Peter=24, Lisa=23, Bob=32, Peter=20))  # Error: duplicated keys
## End(Not run)



