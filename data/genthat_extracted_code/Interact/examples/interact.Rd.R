library(Interact)


### Name: interact
### Title: Test marginal interactions for a model with binary response
### Aliases: interact
### Keywords: interactions FDR

### ** Examples

set.seed(5)

n <- 100
p <- 10
s <- 5

X1 <- cbind(matrix(rnorm(n*s), ncol = s) + rnorm(n), matrix(rnorm(n*(p-s)), ncol = (p-s)))
X2 <- matrix(rnorm(n * p), ncol = p)

X <- rbind(X1, X2)

colnames(X) <- c("a","b","c","d","e","f","g","h","i","j")
y <- c(rep("y",n),rep("n",n))

fit <- interact(X,y)
print(fit)
plot(fit)

## Bigger Example (restricting the number of top interactions to consider)
## Not run:
## Not run: 
##D n <- 300
##D p <- 500
##D s <- 10
##D 
##D X1 <- cbind(matrix(rnorm(n*s), ncol = s) + rnorm(n), matrix(rnorm(n*(p-s)), ncol = (p-s)))
##D X2 <- matrix(rnorm(n * p), ncol = p)
##D X <- rbind(X1, X2)
##D 
##D y <- c(rep("y",n),rep("n",n))
##D 
##D fit <- interact(X,y, numFDR = 50)  
##D ## Restricts the number of most significant interactions to consider to 50
##D print(fit)
##D plot(fit)
## End(Not run)

## Example Comparing (simulated) Genes and Enviromental Variables

## Not run: 
##D n <- 100
##D p1 <- 100
##D p2 <- 10
##D 
##D 
##D Genes <- matrix(rnorm(n * p1), ncol = p1)
##D Environment <- matrix(rnorm(n * p2), ncol = p2)
##D 
##D y <- c(rep("y",n/2),rep("n",n/2))
##D 
##D fit <- interact(X = Genes,y, Z = Environment, numFDR = 50)  
##D ## Restricts the number of most significant interactions to consider to 50
##D print(fit)
##D plot(fit)
## End(Not run)
## End(**Not run**)





