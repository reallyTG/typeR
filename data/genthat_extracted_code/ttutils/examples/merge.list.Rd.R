library(ttutils)


### Name: merge.list
### Title: Merge Two Lists
### Aliases: merge.list

### ** Examples

merge(list(a=1, b="test"), list(3, b=2)) # list(a=1, b="test", 3)
merge(list(1), "test")                   # list(1, "test")
merge(list(1), "test", FALSE)            # list(1)
merge(list(1))                           # list(1)
merge(list(1, a=2, b=3), list(2, b=4))   # list(1, a=2, b=3, 2)
merge(list(1), list(2, b=3), FALSE)      # list(1, b=3)

a <- list(1, 2, 3)
b <- list("a", "b", "c")
names(a)[2] <- names(b)[2] <- "z"
all.equal(merge(a, b), list(1, z=2, 3, "a", "c")) # TRUE



