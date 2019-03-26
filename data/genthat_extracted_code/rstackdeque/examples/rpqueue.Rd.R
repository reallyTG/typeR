library(rstackdeque)


### Name: rpqueue
### Title: Create a new empty rpqueue
### Aliases: rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")
print(q)

q2 <- without_front(q)
print(q2)
print(q)

b <- peek_front(q)
print(b)



