library(rstackdeque)


### Name: insert_top.rstack
### Title: Insert an element onto the top of an rstack
### Aliases: insert_top.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
print(s)

s2 <- insert_top(s, "c")
print(s2)
print(s)



