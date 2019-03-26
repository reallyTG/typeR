library(rstackdeque)


### Name: insert_front
### Title: Insert an element into the front of an rdeque
### Aliases: insert_front

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
print(d)

d2 <- insert_front(d, "c")
print(d2)
print(d)



