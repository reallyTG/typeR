library(intervals)


### Name: empty
### Title: Identify empty interval rows
### Aliases: empty empty,Intervals-method empty,Intervals_full-method

### ** Examples

z1 <- Intervals( cbind( 1, 1:3 ), type = "Z" )
z2 <- z1; closed(z2)[1] <- FALSE
z3 <- z1; closed(z3) <- FALSE

empty(z1)
empty(z2)
empty(z3)

r1 <- z1; type(r1) <- "R"
r2 <- z2; type(r2) <- "R"
r3 <- z3; type(r3) <- "R"

empty(r1)
empty(r2)
empty(r3)

s1 <- Intervals_full( matrix( 1, 3, 2 ), type = "Z" )
closed(s1)[2,2] <- FALSE
closed(s1)[3,] <- FALSE

empty(s1)



