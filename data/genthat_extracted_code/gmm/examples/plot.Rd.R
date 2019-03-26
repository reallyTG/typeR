library(gmm)


### Name: plot
### Title: Plot Diagnostics for gel and gmm objects
### Aliases: plot.gel plot.gmm

### ** Examples


# GEL #
n = 500
phi<-c(.2,.7)
thet <- 0
sd <- .2
x <- matrix(arima.sim(n = n,list(order = c(2,0,1), ar = phi, ma = thet, sd = sd)), ncol = 1)
y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]

H <- cbind(x[4:(n-3)], x[3:(n-4)], x[2:(n-5)], x[1:(n-6)])
g <- y ~ ym1 + ym2
x <- H
t0 <- c(0,.5,.5)

res <- gel(g, x, t0)

plot(res, which = 3)
plot(res, which = 4)

# GMM #

res <- gmm(g, x)
plot(res, which = 3)



