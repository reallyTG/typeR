library(rstackdeque)


### Name: peek_front.rdeque
### Title: Return the data element at the front of an rdeque
### Aliases: peek_front.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
e <- peek_front(d)
print(e)
print(d)

## Assigning to the front data element with peek_front:
d <- rdeque()
d <- insert_front(d, data.frame(a = 1, b = 1))
d <- insert_front(d, data.frame(a = 1, b = 1))

peek_front(d)$a <- 100
print(d)

peek_front(d) <- data.frame(a = 100, b = 100)
print(d)



