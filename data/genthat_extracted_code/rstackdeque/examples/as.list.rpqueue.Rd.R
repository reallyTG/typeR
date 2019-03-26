library(rstackdeque)


### Name: as.list.rpqueue
### Title: Convert an rpqueue to a list
### Aliases: as.list.rpqueue

### ** Examples

q <- rpqueue()
q <- insert_back(q, "a")
q <- insert_back(q, "b")

qlist <- as.list(q)
print(qlist)



