library(RIFS)


### Name: preRSum0
### Title: Prefractal points in R^n generated with a matrix of random sums
### Aliases: preRSum0

### ** Examples

# Example 1a. Sierpinski triangle, 1st order, p=const, mu=const
l <- preRSum0()
plot(l$proto, asp=1, col="red",
     main="Prefractal points for 3-gon: k=3; p=1/3; mu=1")
points(l$pre, pch=46, col="red")

# Example 1b. Sierpinski triangle, 1st order, p=var, mu=const
l <- preRSum0(P=c(2,2,5)/9)
plot(l$proto, asp=1, col="red",
     main="Prefractal points for 3-gon: k=3; p=(2,2,5)/9; mu=1")
points(l$pre, pch=46, col="red")

# Example 2a. Sierpinski square, 2nd order, p=const, mu=const
l <- preRSum0(Z=R2ngon(4,2), mu=2)
plot(l$proto, asp=1, col="red", 
     main="Prefractal points for 4-gon: k=8, p=1/8, mu=2")
points(l$pre, pch=46, col="red")

# Example 2b. Sierpinski square, 2nd order, p=var, mu=const
l <- preRSum0(Z=R2ngon(4,2), P=2^abs(seq(-3,4))/45, mu=2)
plot(l$proto, asp=1, col="red", 
     main="Prefractal points for 4-gon: k=8, p=2^|-3:4|/45, mu=2")
points(l$pre, pch=46, col="red")



