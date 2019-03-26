library(rstackdeque)


### Name: peek_front.rpqueue
### Title: Return the data element at the front of an rpqueue
### Aliases: peek_front.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")
e <- peek_front(q)
print(e)
print(q)

## Assigning to the front data element with peek_front:
q <- rpqueue()
q <- insert_back(q, data.frame(a = 1, b = 1))
q <- insert_back(q, data.frame(a = 1, b = 1))

peek_front(q)$a <- 100
print(q)

peek_front(q) <- data.frame(a = 100, b = 100)
print(q)



