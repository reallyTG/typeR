library(rstackdeque)


### Name: as.list.rstack
### Title: Convert an rstack to a list
### Aliases: as.list.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")

slist <- as.list(s)
print(slist)



