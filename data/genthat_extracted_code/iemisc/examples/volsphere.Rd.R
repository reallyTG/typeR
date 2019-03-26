library(iemisc)


### Name: volsphere
### Title: Sphere volume
### Aliases: volsphere

### ** Examples

library(iemisc)
volsphere(3) # in

volsphere(4.5) # in


x <- c(3, 4, 0.2, 12, 34, 7.5) # cm
volsphere(x)


# using a matrix of the numeric vector x
mat1 <- matrix(data = x, nrow = length(x), ncol = 1, byrow = FALSE,
       dimnames = list(c(rep("", length(x))), "Radius"))
volsphere(mat1)


# using a data.frame of the numeric vector x
df1 <- data.frame(x)
volsphere(df1)


# using a data.table of the numeric vector x
df2 <- data.table(x)
volsphere(df2)







