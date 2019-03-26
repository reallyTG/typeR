library(rstackdeque)


### Name: head.rdeque
### Title: Return the first n elements of an rdeque as an rdeque
### Aliases: head.rdeque

### ** Examples

d <- rdeque()
d <- insert_back(d, "a")
d <- insert_back(d, "b")
d <- insert_back(d, "c")

dt <- head(d, n = 2)
print(dt)



