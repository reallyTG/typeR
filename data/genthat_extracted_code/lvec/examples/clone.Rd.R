library(lvec)


### Name: clone
### Title: Clone an lvec object
### Aliases: clone clone.lvec

### ** Examples

a <- as_lvec(1:3)
# Copy
b <- a
# When modifying the copy also the original is modified
lset(b, 1, 10)
print(a)
print(b)
# Use clone to make a true copy
b <- clone(a)
lset(b, 1, 100)
print(a)
print(b)




