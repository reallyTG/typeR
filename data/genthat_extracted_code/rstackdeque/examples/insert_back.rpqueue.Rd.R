library(rstackdeque)


### Name: insert_back.rpqueue
### Title: Insert an element into the back of an rpqueue
### Aliases: insert_back.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")
print(q)

q2 <- insert_back(q, "c")
print(q2)
print(q)



