library(rstackdeque)


### Name: without_top
### Title: Return a version of an rstack without the top element
### Aliases: without_top

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
s <- insert_top(s, "c")

s2 <- without_top(s)
print(s2)

print(s)



