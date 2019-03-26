library(sjmisc)


### Name: is_empty
### Title: Check whether string, list or vector is empty
### Aliases: is_empty

### ** Examples

is_empty("test")
is_empty("")
is_empty(NA)
is_empty(NULL)

# string is not empty
is_empty(" ")

# however, this trimmed string is
is_empty(trim(" "))

# numeric vector
x <- 1
is_empty(x)
x <- x[-1]
is_empty(x)

# check multiple elements of character vectors
is_empty(c("", "a"))
is_empty(c("", "a"), first.only = FALSE)

# empty data frame
d <- data.frame()
is_empty(d)




