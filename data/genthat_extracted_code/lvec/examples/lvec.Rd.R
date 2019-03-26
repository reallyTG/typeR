library(lvec)


### Name: lvec
### Title: Create memory mapped vector
### Aliases: lvec

### ** Examples

# create an integer vector of length 100
x <- lvec(100, type = "integer")
# Get the first 10 values; values are initialised to 0 by default
lget(x, 1:10)
# Set the first 10 values to 11:20
lset(x, 1:10, 11:20)

# set maximum length of the string to 1, strings longer than that get
# truncated. However, minimum value of strlen is 2. 
x <- lvec(10, type = "character", strlen = 1)
lset(x, 1:3, c("a", "foo", NA))
lget(x, 1:3)




