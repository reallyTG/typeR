library(naivereg)


### Name: naive.gel
### Title: Estimete the parameters with gel after IV selecting
### Aliases: naive.gel

### ** Examples

#gel estimate after IV selecting
n = 200
phi<-c(.2,.7)
thet <- 0.2
sd <- .2
set.seed(123)
x <- matrix(arima.sim(n = n, list(order = c(2,0,1), ar = phi, ma = thet, sd = sd)), ncol = 1)
y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]
H <- cbind(x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
g <- y ~ ym1 + ym2
x <- H
naive.gel(g, cbind(ym1,ym2),x, tet0 =c(0,.3,.6))



