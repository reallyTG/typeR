library(sglg)


### Name: ssurvglg
### Title: Fitting semi-parametric generalized log-gamma regression models
###   under the presence of right censored data.
### Aliases: ssurvglg

### ** Examples

rows    <- 150
columns <- 2
t_beta  <- c(0.5, 2)
t_sigma <- 0.75
t_lambda <- 1
set.seed(8142030)
library(ssym)
x1 <- rbinom(rows, 1, 0.5)
x2 <- runif(rows, 0, 1)
X <- cbind(x1,x2)
t_knot1 <- 6
ts1 <- seq(0, 1, length = t_knot1)
t_g1 <- 0.4 * sin(pi * ts1)
BasisN <- function(n, knot) {
N <- matrix(0, n, knot)
m <- n/knot
block <- rep(1,m)
for (i in 1:knot) {
   l <- (i - 1) * m + 1
 r <- i * m
  N[l:r, i] <- block }
return(N)
 }
s_N1 <- BasisN(rows, length(ts1))
x3 <- s_N1 %*% ts1
colnames(x3) <- 'x3'
sys       <- X %*% t_beta + s_N1%*%t_g1
t_ini1    <- exp(sys) * rweibull(rows,1/t_sigma,1)
cens.time <- rweibull(rows, 1.5, 14)
delta     <- ifelse(t_ini1 > cens.time, 1, 0)
obst1 = t_ini1
for(i in 1:rows) {
   if (delta[i] == 1) {
       obst1[i] = cens.time[i]
      }
}
data.example <- data.frame(obst1, delta, X, x3)
fit4  <- ssurvglg(Surv(log(obst1),delta)~ x1 + x2 - 1, npc=x3, data=data.example, shape=0.8)



