library(rstackdeque)


### Name: peek_back
### Title: Return the data element at the back of an rdeque
### Aliases: peek_back

### ** Examples

d <- rdeque()
d <- insert_front(d, "a")
d <- insert_front(d, "b")
e <- peek_back(d)
print(e)
print(d)

## Assigning to the front data element with peek_front:
d <- rdeque()
d <- insert_front(d, data.frame(a = 1, b = 1))
d <- insert_front(d, data.frame(a = 1, b = 1))

peek_back(d)$a <- 100
print(d)

peek_back(d) <- data.frame(a = 100, b = 100)
print(d)



