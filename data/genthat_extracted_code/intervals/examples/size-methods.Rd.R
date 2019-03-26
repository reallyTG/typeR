library(intervals)


### Name: size
### Title: Compute interval sizes
### Aliases: size size,Intervals-method size,Intervals_full-method

### ** Examples

z1 <- Intervals( cbind( 1, 1:3 ), type = "Z" )
z2 <- z1; closed(z2)[1] <- FALSE
z3 <- z1; closed(z3) <- FALSE

size(z1)
size(z2)
size(z3)

r1 <- z1; type(r1) <- "R"
r2 <- z2; type(r2) <- "R"
r3 <- z3; type(r3) <- "R"

size(r1)
size(r2)
size(r3)

s1 <- Intervals_full( matrix( 1, 3, 2 ), type = "Z" )
closed(s1)[2,2] <- FALSE
closed(s1)[3,] <- FALSE

size(s1)



