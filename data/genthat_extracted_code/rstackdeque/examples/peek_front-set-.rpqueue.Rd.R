library(rstackdeque)


### Name: peek_front<-.rpqueue
### Title: Assign to/modify the front of an rpqueue
### Aliases: peek_front<-.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, data.frame(a = 1, b = 1))
q <- insert_back(q, data.frame(a = 1, b = 1))

peek_front(q)$a <- 100
print(q)

peek_front(q) <- data.frame(a = 100, b = 100)
print(q)



