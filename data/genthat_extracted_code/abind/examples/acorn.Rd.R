library(abind)


### Name: acorn
### Title: Return a corner of an array object (like head)
### Aliases: acorn ahead acorn.default
### Keywords: manip array

### ** Examples

x <- array(1:24,dim=c(4,3,2),dimnames=rev(list(letters[1:2],LETTERS[1:3],letters[23:26])))
acorn(x)
acorn(x, 3)
acorn(x, -3)
acorn(x, 3, -2)



