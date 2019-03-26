library(Umpire)
#####################
#JX: do not run the following for now

if(FALSE) {
  
mu <- rnorm(6, 0, 1)
sigma <- 1/rgamma(6, 2, 3)
ind <- IndependentNormal(mu, sigma)

roo <- rand(ind, 3)

a <- runif(1)
b <- sqrt(1-a^2)
X <- matrix(c(a, b, -b, a), 2, 2)
Lambda2 <- diag(rev(sort(rexp(2))), 2)
Y <- t(X) %*% Lambda2 %*% X
marvin <- MVN(c(0,0), Y)

mar2 <- alterSD(marvin, function(x) 2*x)
mar2 <- alterSD(marvin, function(x) 1+x)

roo <- rand(marvin, 1000)
cov(t(roo))

engine <- new("Engine", components=list(marvin, marvin, ind))
roo <- rand(engine, 3)

cancerEngine <- alterMean(engine, normalOffset, delta=0, sigma=1.5)

nrow(ind)
nrow(marvin)
nrow(engine)

#JX: change "x <- CancerModel(30, 10," to the following line 
x <- CancerModel('test',30, 10,
         HIT=function(n) 3+rbinom(1, 4, 0.7),
         SURV=function(n) rnorm(n, 0, 2),
         OUT=function(n) rnorm(n, 0, 2))


###################################
rot <- function(n, N) {M <- (N-2)/2; x <- rbeta(n,M,M); 2*x-1}
qot <- function(p, N) {M <- (N-2)/2; x <- qbeta(p,M,M); 2*x-1}
pot <- function(q, N) {M <- (N-2)/2; pbeta((q+1)/2,M,M)}

xx <- seq(0,1, length=300)
yy <- 2*xx-1
plot(xx, pbeta(xx, 10, 10))
plot(xx, qbeta(xx, 10, 10))

plot(xx, qot(xx, 12))
plot(yy, pot(yy, 12))

qot(0.99, 10)

### mutual information with NED status
mutinf <- function(x, y, ncut=10) {
  temp <- diff(sort(x))
  epsilon <- min(temp[temp>0])/2
  decile <- trunc(1+ncut*(x-min(x))/(epsilon+max(x)-min(x)))
  if (length(unique(y)) > ncut ) {
    tem <- diff(sort(y))
    eps <- min(temp[tem>0])/2
    yo <- trunc(1+ncut*(y-min(y))/(epsilon+max(y)-min(y)))
  } else {
    yo <- y
  }
  tab <- table(decile, yo)
  tab <- tab/sum(tab)
  px <- apply(tab, 1, sum)
  py <- apply(tab,2, sum)
  stab <- tab*log2(tab/outer(px, py))
  sum(stab, na.rm=TRUE)
}

mutinf(rnorm(1000), rnorm(1000))
x <- rnorm(1000)
mutinf(x, x)
y <- rbinom(1000, 1,0.5)
mutinf(x,y)

N <- 50
x <- rnorm(N)
y <- unlist(lapply(1:500, function(i, xx) {
  mutinf(xx, rnorm(length(xx)))
}, x))
hist(y)


require(mclust)
N <- 500
x <- rnorm(300)
a2 <- Mclust(x, 2, 2)
a1 <- Mclust(x, 1, 1)
chi1 <- 2*(a2$loglik - a1$loglik)
chi <- rep(NA, N)
for (i in 1:N) {
  print(i)
  y <- sample(x, 300, replace=TRUE)
  a2 <- Mclust(y, 2, 2)
  a1 <- Mclust(y, 1, 1)
  chi[i] <- 2*(a2$loglik - a1$loglik)
}

x <- rnorm(10000, 0, 1)
y <- rnorm(10000, 10, 1)
z <- 0.3*x + 0.7*y
mean(z)
var(z)
sd(z)

xx <- seq(-5, 5, length=400)
yy <- dnorm(xx, 0, 0.3) + dnorm(xx, 0, 3)
plot(xx, yy)


nns <- function(delta, sigma, alpha=0.05, beta=0.20) {
  z.a2 <- qnorm(1-alpha/2)
  z.b <- qnorm(1-beta)
  (z.a2 + z.b)^2*sigma^2/delta^2
}

a <- seq(0,1, length=200)
plot(sqrt(a^2 + (1-a)^2), type='l')

1.666667*c(0.51, 0.557, 0.586)
1.666667*c(0.51, 0.557, 0.586)*0.7

2^(c(0.51, 0.557, 0.586))
2^(1.666667*c(0.51, 0.557, 0.586))

2^(c(0.51, 0.557, 0.586)*0.7)
2^(1.666667*c(0.51, 0.557, 0.586)*0.7)

}
