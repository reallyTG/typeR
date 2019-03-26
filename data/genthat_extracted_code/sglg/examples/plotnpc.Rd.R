library(sglg)


### Name: plotnpc
### Title: Plotting a natural cubic splines or P-splines.
### Aliases: plotnpc

### ** Examples

rows <- 175 # Number of observations
columns <- 2 # Number of parametric components
library(ssym)
t_beta  <- c(0.5, 2)
t_sigma <- 1
t_lambda <- 1
t_knot1 <- 7
ts1 <- seq(0, 1, length = t_knot1)
t_g1 <- 0.4 * sin(pi * ts1)

BasisN <- function(n, knot) {
          N <- matrix(0, n, knot)
          m <- n/knot
          block <- matrix(1, m, 1)
          for (i in 1:knot) {
          l <- (i - 1) * m + 1
          r <- i * m
          N[l:r, i] <- block }
          return(N)
          }
s_N1 <- BasisN(rows, length(ts1))
x3 <- s_N1 %*% ts1
colnames(x3) <- 'x3'
set.seed(8142031)
x1 <- rbinom(rows, 1, 0.5)
x2 <- runif(rows, 0, 1)
X <- cbind(x1,x2)
error <- rglg(rows, 0, 1, t_lambda)
y1 <- X %*%t_beta + + s_N1 %*% t_g1 + t_sigma * error
data.example <- data.frame(y1,X,x3)
fit1 <- sglg(y1 ~ x1 + x2 - 1, npc=x3, method='FS',data=data.example)
plotnpc(fit1)



