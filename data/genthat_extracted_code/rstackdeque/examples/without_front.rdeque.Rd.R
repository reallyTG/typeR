library(rstackdeque)


### Name: without_front.rdeque
### Title: Return a version of an rdeque without the front element
### Aliases: without_front.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
d <- insert_front(d, "c")

d2 <- without_front(d)
print(d2)

d3 <- without_front(d)
print(d3)

print(d)



