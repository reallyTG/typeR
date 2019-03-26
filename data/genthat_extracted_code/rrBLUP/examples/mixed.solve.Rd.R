library(rrBLUP)


### Name: mixed.solve
### Title: Mixed-model solver
### Aliases: mixed.solve

### ** Examples

#random population of 200 lines with 1000 markers
M <- matrix(rep(0,200*1000),200,1000)
for (i in 1:200) {
  M[i,] <- ifelse(runif(1000)<0.5,-1,1)
}

#random phenotypes
u <- rnorm(1000)
g <- as.vector(crossprod(t(M),u))
h2 <- 0.5  #heritability
y <- g + rnorm(200,mean=0,sd=sqrt((1-h2)/h2*var(g)))

#predict marker effects
ans <- mixed.solve(y,Z=M)  #By default K = I
accuracy <- cor(u,ans$u)

#predict breeding values
ans <- mixed.solve(y,K=A.mat(M))
accuracy <- cor(g,ans$u)




