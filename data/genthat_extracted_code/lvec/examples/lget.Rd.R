library(lvec)


### Name: lget
### Title: Read elements from an lvec
### Aliases: lget lget.lvec lget.default lget.data.frame

### ** Examples

a <- as_lvec(letters[1:4])
# Select first two elements
lget(a, 1:2)
lget(a, c(TRUE, TRUE, FALSE, FALSE))
lget(a, range = c(1,2))

# Logical indices are recycled: select odd elements
lget(a, c(TRUE, FALSE))




