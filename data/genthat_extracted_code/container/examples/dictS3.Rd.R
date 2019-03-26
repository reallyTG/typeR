library(container)


### Name: dictS3
### Title: Dict constructors
### Aliases: dictS3 dict as.dict is.dict getval keys popitem setval sortkey

### ** Examples

ages <- dict(c(Peter=24, Lisa=23, Bob=32))
has(ages, "Peter")   # TRUE
ages["Lisa"]         # 23
ages["Mike"]         # NULL
ages["Mike"] <- 18
ages["Mike"]         # 18
keys(ages)
print(ages)

## Not run: 
##D ages["Peter"] <- 24 + 1     # key 'Peter' already in Dict
##D dict(c(Peter=24, Peter=20)) # Error: duplicated keys
## End(Not run)



