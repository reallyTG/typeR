library(rstackdeque)


### Name: rev.rstack
### Title: Reverse an rstack
### Aliases: rev.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
s <- insert_top(s, "c")

r <- rev(s)
print(r)
print(s)



