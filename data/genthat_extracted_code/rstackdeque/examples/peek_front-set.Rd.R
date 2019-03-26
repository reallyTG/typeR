library(rstackdeque)


### Name: peek_front<-
### Title: Assign to/modify the front of an rdeque or rpqueue
### Aliases: peek_front<-

### ** Examples

d <- rdeque()
d <- insert_front(d, data.frame(a = 1, b = 1))
d <- insert_front(d, data.frame(a = 1, b = 1))

peek_front(d)$a <- 100
print(d)

peek_front(d) <- data.frame(a = 100, b = 100)



q <- rpqueue()
q <- insert_front(d, data.frame(a = 1, b = 1))
q <- insert_front(d, data.frame(a = 1, b = 1))

peek_front(q)$a <- 100
print(q)

peek_front(q) <- data.frame(a = 100, b = 100)



