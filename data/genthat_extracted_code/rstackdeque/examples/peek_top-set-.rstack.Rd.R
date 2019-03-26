library(rstackdeque)


### Name: peek_top<-.rstack
### Title: Assign to/modify the top of an rstack
### Aliases: peek_top<-.rstack

### ** Examples

s <- rstack()
s <- insert_top(s, data.frame(a = 1, b = 1))
s <- insert_top(s, data.frame(a = 1, b = 1))

peek_top(s)$a <- 100
print(s)

peek_top(s) <- data.frame(a = 100, b = 100)



