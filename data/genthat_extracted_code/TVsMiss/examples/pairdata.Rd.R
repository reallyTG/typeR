library(TVsMiss)


### Name: pairdata
### Title: Generate paired dataset from original dataset
### Aliases: pairdata

### ** Examples

n <- 50
p <- 8
beta <- c(3,0,1.5,0,2,rep(0,p-5))
xm <- matrix(rnorm(n*p),ncol = p, nrow = n)
y <- xm %*% beta + rnorm(n)
colnames(xm) <- paste0("Var_",1:p)
pair01 <- pairdata(cbind(y,xm))
nrow(pair01) == choose(n,2)




