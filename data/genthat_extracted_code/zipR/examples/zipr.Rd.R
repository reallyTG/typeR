library(zipR)


### Name: zipr
### Title: zip two vector-like objects into a dataframe
### Aliases: zipr

### ** Examples


a <- c(1,2,3)
b <- c(4,5,6)
c <- c(1,2,3,4,5,6)
d <- c(7,8)
z <- c(9)
filler <- c(NA)

# zip two vectors of the same length
zipr(a,b)

# zip two vectors of different lengths, repeating the shorter vector
zipr(a, z, broadcast = TRUE)

# zip two vectors of different lengths, using the default fill value
zipr(z, a, fill = TRUE)

# zip two vectors of different lengths, using a custom fill value
zipr(c,a, fill = TRUE, fillvalue = z)



