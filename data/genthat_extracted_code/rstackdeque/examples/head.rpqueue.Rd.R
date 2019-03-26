library(rstackdeque)


### Name: head.rpqueue
### Title: Return the head (front) of an rpqueue
### Aliases: head.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")
q <- insert_back(q, "c")

qt <- head(q, n = 2)
print(qt)



