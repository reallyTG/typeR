library(catch)


### Name: catch_matrix
### Title: Fit a CATCH model for matrix and predict categorical response.
### Aliases: catch_matrix

### ** Examples

#without prediction
n <- 20
p <- 4
k <- 2
nvars <- p*p
x=array(rnorm(n*nvars),dim=c(p,p,n))
x[,,11:20]=x[,,11:20]+0.3
z <- matrix(rnorm(n*2), nrow=n, ncol=2)
z[1:10,] <- z[1:10,]+0.5
y <- c(rep(1,10),rep(2,10))
obj <- catch_matrix(x,z,y=y)



