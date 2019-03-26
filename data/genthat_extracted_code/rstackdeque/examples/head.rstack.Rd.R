library(rstackdeque)


### Name: head.rstack
### Title: Return the head (top) of an rstack
### Aliases: head.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
s <- insert_top(s, "c")

st <- head(s, n = 2)
print(st)
print(s)



