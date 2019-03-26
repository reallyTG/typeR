library(spray)


### Name: zero
### Title: The zero polynomial
### Aliases: zero empty is.zero is.empty
### Keywords: datasets

### ** Examples


a <- lone(1,3)

is.zero(a-a)  # should be TRUE

is.zero(zero(6))

x <- spray(t(0:1))
y <- spray(t(1:0))

is.zero((x+y)*(x-y)-(x^2-y^2)) # TRUE








