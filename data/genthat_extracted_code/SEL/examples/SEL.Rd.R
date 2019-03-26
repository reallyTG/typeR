library(SEL)


### Name: SEL
### Title: Semiparametric Elicitation of a bounded parameter
### Aliases: SEL
### Keywords: misc

### ** Examples

### example from O'Hagan et al. (2006)
### 1st example in Bornkamp and Ickstadt (2009)
x <- c(177.5, 183.75, 190, 205, 220)
y <- c(0.175, 0.33, 0.5, 0.75, 0.95)
I <- SEL(x, y, d = 1, Delta = 0.015, bounds = c(165, 250), inknts = x)
II <- SEL(x, y, d = 14, N = 0, Delta = 0.015, bounds = c(165, 250))
III <- SEL(x, y, d = 4, Delta = 0.015, bounds = c(165, 250), inknts = x)
IV <- SEL(x, y, d = 4, Delta = 0.015, bounds = c(165, 250), inknts = x,
      constr = "u", mode = 185)
comparePlot(I, II, III, IV, type = "cdf")
comparePlot(I, II, III, IV, type = "density")



### bimodal example 
x2 <- c(0.1, 0.2, 0.5, 0.8, 0.9)
y2 <- c(0.2, 0.4, 0.45, 0.85, 0.99)
fit1 <- SEL(x2, y2, Delta=0.05, d = 4, inknts = x2)
fit2 <- SEL(x2, y2, Delta=0.05, d = 15, N = 0)
comparePlot(fit1, fit2, superpose = TRUE)



### sample from SEL object and evaluate density
xxx <- rvSEL(50000, fit1)
hist(xxx, breaks=100, freq=FALSE)
curve(predict(fit1, newdata=x), add=TRUE)



### illustrate shrinkage against uniform dist.
gma01 <- SEL(x2, y2, gamma = 0.1)
gma02 <- SEL(x2, y2, gamma = 0.2)
gma04 <- SEL(x2, y2, gamma = 0.4)
gma10 <- SEL(x2, y2, gamma = 1.0)
comparePlot(gma01, gma02, gma04, gma10, superpose = TRUE)



### including shape constraints
x <- c(177.5, 183.75, 190, 205, 220)
y <- c(0.175, 0.33, 0.5, 0.75, 0.95)
unconstr1 <- SEL(x, y, Delta = 0.05, bounds = c(165, 250))
unconstr2 <- SEL(x, y, d = 10, N = 0, Delta = 0.05, bounds = c(165,250))
unimod1 <- SEL(x, y, Delta = 0.05, bounds = c(165, 250),
            constr = "unimodal", mode = 185)
unimod2 <- SEL(x, y, d = 10, N = 0, Delta = 0.05, bounds = c(165, 250),
           constr =  "unimodal", mode = 185)
comparePlot(unconstr1, unconstr2, unimod1, unimod2)



### shrinkage against another distribution
pr <- function(x) dbeta(x, 2, 2)
pr01  <- SEL(x2, y2, gamma = 0.1, d = 3, pistar = pr)
pr03  <- SEL(x2, y2, gamma = 0.3, d = 3, pistar = pr)
pr12 <- SEL(x2, y2, gamma = 1.2, pistar = pr)
comparePlot(pr01, pr03, pr12, superpose = TRUE)



### 2nd example from Bornkamp and Ickstadt (2009)
# theta
# "true" density
pmixbeta <- function(x, a1, b1, a2, b2){
  0.3*pbeta(x/20,a1,b1)+0.7*pbeta(x/20,a2,b2)
}
dmixbeta <- function(x, a1, b1, a2, b2){
  out <- 0.3*dbeta(x/20,a1,b1)+0.7*dbeta(x/20,a2,b2)
  out/20
}
x <- c(2,10,15)
a1 <- 1;a2 <- 10;b1 <- 15;b2 <- 5
mu <- pmixbeta(x, a1, b1, a2, b2)
set.seed(1) # simulate experts statements
y <- rnorm(length(mu), mu, sqrt(mu*(1-mu)*0.05^2))
thet <- SEL(x, y, d = 4, Delta = 0.03, bounds = c(0, 20), inknts = x)
plot(thet, ylim = c(0,0.25))
curve(dmixbeta(x, a1, b1, a2, b2), add=TRUE, col="red")
abline(h=0.05, lty = 2)
legend("topright", c("true density", "elicited density", "uniform density"), 
       col=c(2,1,1), lty=c(1,1,2))

# sigma
# "true" density
dtriang <- function(x,m,a,b){
  inds <- x < m;res <- numeric(length(x))
  res[inds] <- 2*(x[inds]-a)/((b-a)*(m-a))
  res[!inds] <- 2*(b-x[!inds])/((b-a)*(b-m))
  res
}
ptriang <- function(x,m,a,b){
  inds <- x < m;res <- numeric(length(x))
  res[inds] <- (x[inds]-a)^2/((b-a)*(m-a))
  res[!inds] <- 1-(b-x[!inds])^2/((b-a)*(b-m))
  res
}
x <- c(1,2,4)
mu <- ptriang(x, 1, 0, 5)
set.seed(1) # simulate experts statements
y <- rnorm(length(mu), mu, sqrt(mu*(1-mu)*0.05^2))
sig <- SEL(x, y, d = 4, Delta = 0.03, bounds = c(0, 5),
       inknts = x, mode = 1, constr="unimodal")
plot(sig, ylim=c(0,0.4))
curve(dtriang(x, 1, 0, 5), add=TRUE, col="red")
abline(h=0.2, lty = 2)
legend("topright", c("true density", "elicited density", "uniform density"), 
       col=c(2,1,1), lty=c(1,1,2))


## Not run: 
##D ### generate some random elicitations
##D numb <- max(rnbinom(1, mu = 4, size = 1), 1)
##D x0 <- runif(1, -1000, 1000)
##D x1 <- x0+runif(1, 0, 1000)
##D xs <- sort(runif(numb, x0, x1))
##D y <- runif(numb+1)
##D ys <- (cumsum(y)/sum(y))[1:numb]
##D fit1 <- SEL(xs, ys, bounds = c(x0, x1))
##D fit2 <- SEL(xs, ys, d = 1, inknts = xs, bounds = c(x0, x1))
##D fit3 <- SEL(xs, ys, d = 15, N = 0, bounds = c(x0, x1))
##D comparePlot(fit1, fit2, fit3, type="cdf")
## End(Not run)



