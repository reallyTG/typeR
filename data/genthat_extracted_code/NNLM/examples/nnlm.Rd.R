library(NNLM)


### Name: nnlm
### Title: Non-negative linear model/regression (NNLM)
### Aliases: nnlm

### ** Examples


# without negative value
x <- matrix(runif(50*20), 50, 20);
beta <- matrix(rexp(20*2), 20, 2);
y <- x %*% beta + 0.1*matrix(runif(50*2), 50, 2);
beta.hat <- nnlm(x, y, loss = 'mkl');

# with negative values
x2 <- 10*matrix(rnorm(50*20), 50, 20);
y2 <- x2 %*% beta + 0.2*matrix(rnorm(50*2), 50, 2);
beta.hat2 <- nnlm(x, y);




