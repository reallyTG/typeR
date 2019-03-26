library(rstackdeque)


### Name: without_front.rpqueue
### Title: Return a version of an rpqueue without the front element
### Aliases: without_front.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")
q <- insert_back(q, "c")

q2 <- without_front(q)
print(q2)

q3 <- without_front(q)
print(q3)

print(q)



