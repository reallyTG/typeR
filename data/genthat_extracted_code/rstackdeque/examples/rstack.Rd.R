library(rstackdeque)


### Name: rstack
### Title: Create a new, empty rstack
### Aliases: rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
print(s)

sl <- without_top(s)
print(sl)
print(s)

b <- peek_top(s)
print(b)



