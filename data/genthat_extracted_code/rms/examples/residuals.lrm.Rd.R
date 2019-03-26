library(rms)


### Name: residuals.lrm
### Title: Residuals from an 'lrm' or 'orm' Fit
### Aliases: residuals.lrm residuals.orm plot.lrm.partial
### Keywords: models regression

### ** Examples

set.seed(1)
x1 <- runif(200, -1, 1)
x2 <- runif(200, -1, 1)
L  <- x1^2 - .5 + x2
y  <- ifelse(runif(200) <= plogis(L), 1, 0)
f <- lrm(y ~ x1 + x2, x=TRUE, y=TRUE)
resid(f)            #add rows for NAs back to data
resid(f, "score")   #also adds back rows
r <- resid(f, "partial")  #for checking transformations of X's
par(mfrow=c(1,2))
for(i in 1:2) {
  xx <- if(i==1)x1 else x2
  plot(xx, r[,i], xlab=c('x1','x2')[i])
  lines(lowess(xx,r[,i]))
}
resid(f, "partial", pl="loess")  #same as last 3 lines
resid(f, "partial", pl=TRUE) #plots for all columns of X using supsmu
resid(f, "gof")           #global test of goodness of fit
lp1 <- resid(f, "lp1")    #approx. leave-out-1 linear predictors
-2*sum(y*lp1 + log(1-plogis(lp1)))  #approx leave-out-1 deviance
                                    #formula assumes y is binary


# Simulate data from a population proportional odds model
set.seed(1)
n   <- 400
age <- rnorm(n, 50, 10)
blood.pressure <- rnorm(n, 120, 15)
L <- .05*(age-50) + .03*(blood.pressure-120)
p12 <- plogis(L)    # Pr(Y>=1)
p2  <- plogis(L-1)  # Pr(Y=2)
p   <- cbind(1-p12, p12-p2, p2)   # individual class probabilites
# Cumulative probabilities:
cp  <- matrix(cumsum(t(p)) - rep(0:(n-1), rep(3,n)), byrow=TRUE, ncol=3)
# simulate multinomial with varying probs:
y <- (cp < runif(n)) %*% rep(1,3)
y <- as.vector(y)
# Thanks to Dave Krantz for this trick
f <- lrm(y ~ age + blood.pressure, x=TRUE, y=TRUE)
par(mfrow=c(2,2))
resid(f, 'score.binary',   pl=TRUE)              #plot score residuals
resid(f, 'partial', pl=TRUE)                     #plot partial residuals
resid(f, 'gof')           #test GOF for each level separately


# Show use of Li-Shepherd residuals
f.wrong <- lrm(y ~ blood.pressure, x=TRUE, y=TRUE)
par(mfrow=c(2,1))
# li.shepherd residuals from model without age
plot(age, resid(f.wrong, type="li.shepherd"),
     ylab="li.shepherd residual")
lines(lowess(age, resid(f.wrong, type="li.shepherd")))
# li.shepherd residuals from model including age
plot(age, resid(f, type="li.shepherd"),
     ylab="li.shepherd residual")
lines(lowess(age, resid(f, type="li.shepherd")))


# Make a series of binary fits and draw 2 partial residual plots
#
f1 <- lrm(y>=1 ~ age + blood.pressure, x=TRUE, y=TRUE)
f2  <- update(f1, y==2 ~.)
par(mfrow=c(2,1))
plot.lrm.partial(f1, f2)


# Simulate data from both a proportional odds and a non-proportional
# odds population model.  Check how 3 kinds of residuals detect
# non-prop. odds
set.seed(71)
n <- 400
x <- rnorm(n)

par(mfrow=c(2,3))
for(j in 1:2) {     # 1: prop.odds   2: non-prop. odds
  if(j==1) 
    L <- matrix(c(1.4,.4,-.1,-.5,-.9),nrow=n,ncol=5,byrow=TRUE) + x/2 else {
	  # Slopes and intercepts for cutoffs of 1:5 :
	  slopes <- c(.7,.5,.3,.3,0)
	  ints   <- c(2.5,1.2,0,-1.2,-2.5)
      L <- matrix(ints,nrow=n,ncol=5,byrow=TRUE)+
           matrix(slopes,nrow=n,ncol=5,byrow=TRUE)*x
	}
  p <- plogis(L)
  # Cell probabilities
  p <- cbind(1-p[,1],p[,1]-p[,2],p[,2]-p[,3],p[,3]-p[,4],p[,4]-p[,5],p[,5])
  # Cumulative probabilities from left to right
  cp  <- matrix(cumsum(t(p)) - rep(0:(n-1), rep(6,n)), byrow=TRUE, ncol=6)
  y   <- (cp < runif(n)) %*% rep(1,6)


  f <- lrm(y ~ x, x=TRUE, y=TRUE)
  for(cutoff in 1:5)print(lrm(y>=cutoff ~ x)$coef)


  print(resid(f,'gof'))
  resid(f, 'score', pl=TRUE)
  # Note that full ordinal model score residuals exhibit a
  # U-shaped pattern even under prop. odds
  ti <- if(j==2) 'Non-Proportional Odds\nSlopes=.7 .5 .3 .3 0' else
    'True Proportional Odds\nOrdinal Model Score Residuals'
  title(ti)
  resid(f, 'score.binary', pl=TRUE)
  if(j==1) ti <- 'True Proportional Odds\nBinary Score Residuals'
  title(ti)
  resid(f, 'partial', pl=TRUE)
  if(j==1) ti <- 'True Proportional Odds\nPartial Residuals'
  title(ti)
}
par(mfrow=c(1,1))

# Shepherd-Li residuals from orm.  Thanks: Qi Liu

set.seed(3)
n  <- 100
x1 <- rnorm(n)
y  <- x1 + rnorm(n)
g <- orm(y ~ x1, family=probit, x=TRUE, y=TRUE)
g.resid <- resid(g)
plot(x1, g.resid, cex=0.4); lines(lowess(x1, g.resid)); abline(h=0, col=2,lty=2)

set.seed(3)
n <- 100
x1 <- rnorm(n)
y <- x1 + x1^2 +rnorm(n)
# model misspecification, the square term is left out in the model
g <- orm(y ~ x1, family=probit, x=TRUE, y=TRUE)
g.resid <- resid(g)
plot(x1, g.resid, cex=0.4); lines(lowess(x1, g.resid)); abline(h=0, col=2,lty=2)


## Not run: 
##D # Get data used in Hosmer et al. paper and reproduce their calculations
##D v <- Cs(id, low, age, lwt, race, smoke, ptl, ht, ui, ftv, bwt)
##D d <- read.table("http://www.umass.edu/statdata/statdata/data/lowbwt.dat",
##D                 skip=6, col.names=v)
##D d <- upData(d, race=factor(race,1:3,c('white','black','other')))
##D f <- lrm(low ~ age + lwt + race + smoke, data=d, x=TRUE,y=TRUE)
##D f
##D resid(f, 'gof')
##D # Their Table 7 Line 2 found sum of squared errors=36.91, expected
##D # value under H0=36.45, variance=.065, P=.071
##D # We got 36.90, 36.45, SD=.26055 (var=.068), P=.085
##D # Note that two logistic regression coefficients differed a bit
##D # from their Table 1
## End(Not run)



