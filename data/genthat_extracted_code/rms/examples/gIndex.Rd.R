library(rms)


### Name: gIndex
### Title: Calculate Total and Partial g-indexes for an rms Fit
### Aliases: gIndex print.gIndex plot.gIndex
### Keywords: predictive accuracy robust univar

### ** Examples

set.seed(1)
n <- 40
x <- 1:n
w <- factor(sample(c('a','b'), n, TRUE))
u <- factor(sample(c('A','B'), n, TRUE))
y <- .01*x + .2*(w=='b') + .3*(u=='B') + .2*(w=='b' & u=='B') + rnorm(n)/5
dd <- datadist(x,w,u); options(datadist='dd')
f <- ols(y ~ x*w*u, x=TRUE, y=TRUE)
f
anova(f)
z <- list()
for(type in c('terms','cterms','ccterms'))
  {
    zc <- predict(f, type=type)
    cat('type:', type, '\n')
    print(zc)
    z[[type]] <- zc
  }

zc <- z$cterms
GiniMd(zc[, 1])
GiniMd(zc[, 2])
GiniMd(zc[, 3])
GiniMd(f$linear.predictors)
g <- gIndex(f)
g
g['Total',]
gIndex(f, partials=FALSE)
gIndex(f, type='cterms')
gIndex(f, type='terms')

y <- y > .8
f <- lrm(y ~ x * w * u, x=TRUE, y=TRUE)
gIndex(f, fun=plogis, funlabel='Prob[y=1]')

# Manual calculation of combined main effect + interaction effort of
# sex in a 2x2 design with treatments A B, sexes F M,
# model -.1 + .3*(treat=='B') + .5*(sex=='M') + .4*(treat=='B' & sex=='M')

set.seed(1)
X <- expand.grid(treat=c('A','B'), sex=c('F', 'M'))
a <- 3; b <- 7; c <- 13; d <- 5
X <- rbind(X[rep(1, a),], X[rep(2, b),], X[rep(3, c),], X[rep(4, d),])
y <- with(X, -.1 + .3*(treat=='B') + .5*(sex=='M') + .4*(treat=='B' & sex=='M')) 
f <- ols(y ~ treat*sex, data=X, x=TRUE)
gIndex(f, type='cterms')
k <- coef(f)
b1 <- k[2]; b2 <- k[3]; b3 <- k[4]
n <- nrow(X)
( (a+b)*c*abs(b2) + (a+b)*d*abs(b2+b3) + c*d*abs(b3))/(n*(n-1)/2 )

# Manual calculation for combined age effect in a model with sex,
# age, and age*sex interaction

a <- 13; b <- 7
sex <- c(rep('female',a), rep('male',b))
agef <- round(runif(a, 20, 30))
agem <- round(runif(b, 20, 40))
age  <- c(agef, agem)
y <- (sex=='male') + age/10 - (sex=='male')*age/20
f <- ols(y ~ sex*age, x=TRUE)
f
gIndex(f, type='cterms')
k <- coef(f)
b1 <- k[2]; b2 <- k[3]; b3 <- k[4]
n <- a + b
sp <- function(w, z=w) sum(outer(w, z, function(u, v) abs(u-v)))

( abs(b2)*sp(agef) + abs(b2+b3)*sp(agem) + 2*sp(b2*agef, (b2+b3)*agem) ) / (n*(n-1))

( abs(b2)*GiniMd(agef)*a*(a-1) + abs(b2+b3)*GiniMd(agem)*b*(b-1) +
  2*sp(b2*agef, (b2+b3)*agem) ) / (n*(n-1))

## Not run: 
##D # Compare partial and total g-indexes over many random fits
##D plot(NA, NA, xlim=c(0,3), ylim=c(0,3), xlab='Global',
##D      ylab='x1 (black)  x2 (red)  x3 (green)  x4 (blue)')
##D abline(a=0, b=1, col=gray(.9))
##D big <- integer(3)
##D n <- 50   # try with n=7 - see lots of exceptions esp. for interacting var
##D for(i in 1:100) {
##D    x1 <- runif(n)
##D    x2 <- runif(n)
##D    x3 <- runif(n)
##D    x4 <- runif(n)
##D    y  <- x1 + x2 + x3 + x4 + 2*runif(n)
##D    f <- ols(y ~ x1*x2+x3+x4, x=TRUE)
##D    # f <- ols(y ~ x1+x2+x3+x4, x=TRUE)   # also try this
##D    w <- gIndex(f)[,1]
##D    gt <- w['Total']
##D    points(gt, w['x1, x2'])
##D    points(gt, w['x3'], col='green')
##D    points(gt, w['x4'], col='blue')
##D    big[1] <- big[1] + (w['x1, x2'] > gt)
##D    big[2] <- big[2] + (w['x3'] > gt)
##D    big[3] <- big[3] + (w['x4'] > gt)
##D    }
##D print(big)
## End(Not run)

options(datadist=NULL)



