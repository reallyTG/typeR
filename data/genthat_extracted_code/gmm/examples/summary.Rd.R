library(gmm)


### Name: summary
### Title: Method for object of class gmm or gel
### Aliases: summary.gmm summary.sysGmm summary.gel summary.ategel
###   summary.tsls print.summary.gmm print.summary.sysGmm print.summary.gel
###   print.summary.tsls

### ** Examples


# GMM #
set.seed(444)
n = 500
phi<-c(.2,.7)
thet <- 0
sd <- .2
x <- matrix(arima.sim(n = n, list(order = c(2,0,1), ar = phi, ma = thet, sd = sd)), ncol = 1)
y <- x[7:n]
ym1 <- x[6:(n-1)]
ym2 <- x[5:(n-2)]
ym3 <- x[4:(n-3)]
ym4 <- x[3:(n-4)]
ym5 <- x[2:(n-5)]
ym6 <- x[1:(n-6)]

g <- y ~ ym1 + ym2
x <- ~ym3+ym4+ym5+ym6

res <- gmm(g, x)

summary(res)

# GEL #

t0 <- res$coef
res <- gel(g, x, t0)
summary(res)


# tsls #

res <- tsls(y ~ ym1 + ym2,~ym3+ym4+ym5+ym6)
summary(res)




