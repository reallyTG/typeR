library(rms)


### Name: orm
### Title: Ordinal Regression Model
### Aliases: orm print.orm Quantile.orm
### Keywords: category models

### ** Examples

set.seed(1)
n <- 100
y <- round(runif(n), 2)
x1 <- sample(c(-1,0,1), n, TRUE)
x2 <- sample(c(-1,0,1), n, TRUE)
f <- lrm(y ~ x1 + x2, eps=1e-5)
g <- orm(y ~ x1 + x2, eps=1e-5)
max(abs(coef(g) - coef(f)))
w <- vcov(g, intercepts='all') / vcov(f) - 1
max(abs(w))

set.seed(1)
n <- 300
x1 <- c(rep(0,150), rep(1,150))
y <- rnorm(n) + 3*x1
g <- orm(y ~ x1)
g
k <- coef(g)
i <- num.intercepts(g)
h <- orm(y ~ x1, family=probit)
ll <- orm(y ~ x1, family=loglog)
cll <- orm(y ~ x1, family=cloglog)
cau <- orm(y ~ x1, family=cauchit)
x <- 1:i
z <- list(logistic=list(x=x, y=coef(g)[1:i]),
          probit  =list(x=x, y=coef(h)[1:i]),
          loglog  =list(x=x, y=coef(ll)[1:i]),
          cloglog =list(x=x, y=coef(cll)[1:i]))
labcurve(z, pl=TRUE, col=1:4, ylab='Intercept')

tapply(y, x1, mean)
m <- Mean(g)
m(w <- k[1] + k['x1']*c(0,1))
mh <- Mean(h)
wh <- coef(h)[1] + coef(h)['x1']*c(0,1)
mh(wh)

qu <- Quantile(g)
# Compare model estimated and empirical quantiles
cq <- function(y) {
   cat(qu(.1, w), tapply(y, x1, quantile, probs=.1), '\n')
   cat(qu(.5, w), tapply(y, x1, quantile, probs=.5), '\n')
   cat(qu(.9, w), tapply(y, x1, quantile, probs=.9), '\n')
   }
cq(y)

# Try on log-normal model
g <- orm(exp(y) ~ x1)
g
k <- coef(g)
plot(k[1:i])
m <- Mean(g)
m(w <- k[1] + k['x1']*c(0,1))
tapply(exp(y), x1, mean)

qu <- Quantile(g)
cq(exp(y))

# Compare predicted mean with ols for a continuous x
set.seed(3)
n <- 200
x1 <- rnorm(n)
y <- x1 + rnorm(n)
dd <- datadist(x1); options(datadist='dd')
f <- ols(y ~ x1)
g <- orm(y ~ x1, family=probit)
h <- orm(y ~ x1, family=logistic)
w <- orm(y ~ x1, family=cloglog)
mg <- Mean(g); mh <- Mean(h); mw <- Mean(w)
r <- rbind(ols      = Predict(f, conf.int=FALSE),
           probit   = Predict(g, conf.int=FALSE, fun=mg),
           logistic = Predict(h, conf.int=FALSE, fun=mh),
           cloglog  = Predict(w, conf.int=FALSE, fun=mw))
plot(r, groups='.set.')

# Compare predicted 0.8 quantile with quantile regression
qu <- Quantile(g)
qu80 <- function(lp) qu(.8, lp)
f <- Rq(y ~ x1, tau=.8)
r <- rbind(probit   = Predict(g, conf.int=FALSE, fun=qu80),
           quantreg = Predict(f, conf.int=FALSE))
plot(r, groups='.set.')

# Verify transformation invariance of ordinal regression
ga <- orm(exp(y) ~ x1, family=probit)
qua <- Quantile(ga)
qua80 <- function(lp) log(qua(.8, lp))
r <- rbind(logprobit = Predict(ga, conf.int=FALSE, fun=qua80),
           probit    = Predict(g,  conf.int=FALSE, fun=qu80))
plot(r, groups='.set.')

# Try the same with quantile regression.  Need to transform x1
fa <- Rq(exp(y) ~ rcs(x1,5), tau=.8)
r <- rbind(qr    = Predict(f, conf.int=FALSE),
           logqr = Predict(fa, conf.int=FALSE, fun=log))
plot(r, groups='.set.')
options(datadist=NULL)
## Not run: 
##D ## Simulate power and type I error for orm logistic and probit regression
##D ## for likelihood ratio, Wald, and score chi-square tests, and compare
##D ## with t-test
##D require(rms)
##D set.seed(5)
##D nsim <- 2000
##D r <- NULL
##D for(beta in c(0, .4)) {
##D   for(n in c(10, 50, 300)) {
##D     cat('beta=', beta, '  n=', n, '\n\n')
##D     plogistic <- pprobit <- plogistics <- pprobits <- plogisticw <-
##D       pprobitw <- ptt <- numeric(nsim)
##D     x <- c(rep(0, n/2), rep(1, n/2))
##D     pb <- setPb(nsim, every=25, label=paste('beta=', beta, '  n=', n))
##D     for(j in 1:nsim) {
##D       pb(j)
##D       y <- beta*x + rnorm(n)
##D       tt <- t.test(y ~ x)
##D       ptt[j] <- tt$p.value
##D       f <- orm(y ~ x)
##D       plogistic[j]  <- f$stats['P']
##D       plogistics[j] <- f$stats['Score P']
##D       plogisticw[j] <- 1 - pchisq(coef(f)['x']^2 / vcov(f)[2,2], 1)
##D       f <- orm(y ~ x, family=probit)
##D       pprobit[j]  <- f$stats['P']
##D       pprobits[j] <- f$stats['Score P']
##D       pprobitw[j] <- 1 - pchisq(coef(f)['x']^2 / vcov(f)[2,2], 1)
##D     }
##D     if(beta == 0) plot(ecdf(plogistic))
##D     r <- rbind(r, data.frame(beta         = beta, n=n,
##D                              ttest        = mean(ptt        < 0.05),
##D                              logisticlr   = mean(plogistic  < 0.05),
##D                              logisticscore= mean(plogistics < 0.05),
##D                              logisticwald = mean(plogisticw < 0.05),
##D                              probit       = mean(pprobit    < 0.05),
##D                              probitscore  = mean(pprobits   < 0.05),
##D                              probitwald   = mean(pprobitw   < 0.05)))
##D   }
##D }
##D print(r)
##D #  beta   n  ttest logisticlr logisticscore logisticwald probit probitscore probitwald
##D #1  0.0  10 0.0435     0.1060        0.0655        0.043 0.0920      0.0920     0.0820
##D #2  0.0  50 0.0515     0.0635        0.0615        0.060 0.0620      0.0620     0.0620
##D #3  0.0 300 0.0595     0.0595        0.0590        0.059 0.0605      0.0605     0.0605
##D #4  0.4  10 0.0755     0.1595        0.1070        0.074 0.1430      0.1430     0.1285
##D #5  0.4  50 0.2950     0.2960        0.2935        0.288 0.3120      0.3120     0.3120
##D #6  0.4 300 0.9240     0.9215        0.9205        0.920 0.9230      0.9230     0.9230
## End(Not run)



