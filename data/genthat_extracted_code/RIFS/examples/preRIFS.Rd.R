library(RIFS)


### Name: preRIFS
### Title: Prefractal points in R^n generated with a RIFS
### Aliases: preRIFS

### ** Examples

# Example 1a. Sierpinski triangle, 1st order, p=const, mu=const
l <- preRIFS()
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, asp=1, col=r,
     main="Prefractal points for 3-gon: k=3; p=1/3; mu=1")
points(l$pre, pch=46, col=r[l$index])

# Example 1b. Sierpinski triangle, 1st order, p=var, mu=const
l <- preRIFS(P=c(2,2,5)/9)
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, asp=1, col=r,
     main="Prefractal points for 3-gon: k=3; p=(2,2,5)/9; mu=1")
points(l$pre, pch=46, col=r[l$index])

# Example 1c. Sierpinski triangle, 1st order, p=const, mu=var
l <- preRIFS(M=c(4,4,6)/5)
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, asp=1, col=r,
     main="Prefractal points for 3-gon: k=3; p=1/3; mu=(4,4,6)/5")
points(l$pre, pch=46, col=r[l$index])

# Example 2a. Sierpinski square, 2nd order, p=const, mu=const
l <- preRIFS(Z=R2ngon(4,2), M=rep(2,8))
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, asp=1, col=r, 
     main="Prefractal points for 4-gon: k=8, p=1/8, mu=2")
points(l$pre, pch=46, col=r[l$index])

# Example 2b. Sierpinski square, 2nd order, p=var, mu=const
l <- preRIFS(Z=R2ngon(4,2), P=2^abs(seq(-3,4))/45, M=rep(2,8))
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, col=r, asp=1, 
     main="Prefractal points for 4-gon: k=8, p=2^|-3:4|/45, mu=2")
points(l$pre, pch=46, col=r[l$index])

# Example 2c. Sierpinski square, 2nd order, p=const, mu=var
l <- preRIFS(Z=R2ngon(4,2), M=1.2^abs(seq(-3,4))+0.5)
r <- rainbow(n=nrow(l$proto), v=0.9)
plot(l$proto, col=r, asp=1, 
     main="Prefractal points for 4-gon: k=8, p=1/8, mu=0.5+1.2^|-3:4|")
points(l$pre, pch=46, col=r[l$index])



