library(rstackdeque)


### Name: peek_top.rstack
### Title: Return the data element at the top of an rstack
### Aliases: peek_top.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, "a")
s <- insert_top(s, "b")
e <- peek_top(s)
print(e)
print(s)

## Assigning to the top data element with peek_top:
s <- rstack()
s <- insert_top(s, data.frame(a = 1, b = 1))
s <- insert_top(s, data.frame(a = 1, b = 1))

peek_top(s)$a <- 100
print(s)

peek_top(s) <- data.frame(a = 100, b = 100)



