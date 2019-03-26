library(iemisc)


### Name: shm
### Title: Harmonic mean
### Aliases: shm

### ** Examples

library(iemisc)
# Example 1.12 from Kottegoda (page 13)
x <- c(0.20, 0.24, 0.16) # stream velocities in m/s
shm(x)

# using a matrix of the numeric vector x
mat1 <- matrix(data = x, nrow = length(x), ncol = 1, byrow = FALSE,
        dimnames = list(c(rep("", length(x))), "Velocities"))
shm(mat1)


# using a data.frame of the numeric vector x
df1 <- data.frame(x)
shm(df1)


# using a data.table of the numeric vector x
df2 <- data.table(x)
shm(df2)





