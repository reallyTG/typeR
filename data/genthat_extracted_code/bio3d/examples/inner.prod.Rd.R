library(bio3d)


### Name: inner.prod
### Title: Mass-weighted Inner Product
### Aliases: inner.prod
### Keywords: utilities

### ** Examples

## Matrix operations
x <- 1:3
y <- diag(x)
z <- matrix(1:9, ncol = 3, nrow = 3)

inner.prod(x,y)
inner.prod(y,z)


## Application to normal modes
pdb <- read.pdb( system.file("examples/1hel.pdb", package="bio3d") )

## Calculate (vibrational) normal modes
modes <- nma(pdb)

## Check for orthogonality 
inner.prod(modes$U[,7], modes$U[,8])




