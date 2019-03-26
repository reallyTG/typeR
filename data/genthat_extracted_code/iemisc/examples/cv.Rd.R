library(iemisc)


### Name: cv
### Title: Coefficient of variation (CV)
### Aliases: cv

### ** Examples

library(iemisc)

# Example 2.60 from Miller (page 38)
x <- c(14, 12, 21, 28, 30, 63, 29, 63, 55, 19, 20) # suspended solids in
     # parts per million (ppm)
cv(x)


# using a matrix of the numeric vector x
mat1 <- matrix(data = x, nrow = length(x), ncol = 1, byrow = FALSE,
        dimnames = list(c(rep("", length(x))), "Samples"))
cv(mat1)


# using a data.frame of the numeric vector x
df1 <- data.frame(x)
cv(df1)


# using a data.table of the numeric vector x
df2 <- data.table(x)
cv(df2)





