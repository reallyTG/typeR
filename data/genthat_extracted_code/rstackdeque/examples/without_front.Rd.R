library(rstackdeque)


### Name: without_front
### Title: Return a version of an rdeque or rpqueue without the front
###   element
### Aliases: without_front

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
d <- insert_back(d, "c")

d2 <- without_front(d)
print(d2)

d3 <- without_front(d2)
print(d3)

print(d)



