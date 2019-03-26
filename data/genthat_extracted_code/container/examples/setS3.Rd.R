library(container)


### Name: setS3
### Title: Set constructors
### Aliases: setS3 set as.set is.set

### ** Examples

s1 <- set(list(1, 2, "A", "B"))
s2 <- set(values(s1))
s1 == s2     # TRUE
s1$add(1)    # 1 was already in set, therefore ...
s1 == s2     # ... still TRUE
s1$add(3)
s1 == s2     # FALSE
s1 > s2      # TRUE
s1 - s2      # the added element
unlist(values(s1 / s2))

## Not run: 
##D s1$remove(4)              # Error: 3 not in Set
## End(Not run)



