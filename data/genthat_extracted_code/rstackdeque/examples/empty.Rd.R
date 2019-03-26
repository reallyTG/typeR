library(rstackdeque)


### Name: empty
### Title: Check if an rstack, rdeque, or rpqueue is empty
### Aliases: empty

### ** Examples

s <- rstack()
print(empty(s))        ## TRUE
s <- insert_top(s, "a")
print(empty(s))        ## FALSE



