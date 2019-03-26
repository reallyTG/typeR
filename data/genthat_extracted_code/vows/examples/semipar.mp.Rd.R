library(vows)


### Name: semipar.mp
### Title: Massively parallel semiparametric regression
### Aliases: semipar.mp

### ** Examples


n<-32
Ys <- matrix(0, n, 5)
for(i in 1:n) Ys[i,]<--2:2+rnorm(5, i^2, i^0.5)+sin(i)
x1 <- rnorm(n,0,5)
x2 <- 1:n+runif(n, 1, 20)
semipar.obj <- semipar.mp(~x1+sf(x2,k=10),Y=Ys,lsp=seq(5,50,,30))



