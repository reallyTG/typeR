library(rstackdeque)


### Name: peek_back<-.rdeque
### Title: Assign to/modify the back of an rdeque
### Aliases: peek_back<-.rdeque

### ** Examples

d <- rdeque()
d <- insert_front(d, data.frame(a = 1, b = 1))
d <- insert_front(d, data.frame(a = 1, b = 1))

peek_back(d)$a <- 100
print(d)

peek_back(d) <- data.frame(a = 100, b = 100)



