library(berryFunctions)


### Name: gof
### Title: GOF measures
### Aliases: gof gofNA rsquare rmse nse kge
### Keywords: ts univar

### ** Examples

# R squared and RMSE --------------------------------------------------------
set.seed(123)
x <- rnorm(20)
y <- 2*x + rnorm(20)
plot(x,y)
legGOF <- function(a,b)
  {
  text(a,b, paste(c("      R2","RMSE","  NSE","  KGE"), collapse="\n"), adj=1.2)
  text(a,b, paste(round(c(rsquare(x,y), rmse(x,y), nse(x,y), kge(x,y)),5),
                  collapse="\n"), adj=0)
  }
legGOF(-1.5, 2) # R2 good, but does not check for bias (distance from 1:1 line)

abline(a=0,b=1) ; textField(-1.5,-1.5, "1:1")
abline(lm(y~x), col="red")
p <- predict(lm(y~x))
points(x, p, pch=3, col="red")
segments(x, y, x, p, col="red")
stopifnot(all.equal(  nse(y,p) , rsquare(y,x)  ))


# Input checks
is.error(   rmse(1:6, 1:8)    ,  tell=TRUE)
nse(replace(x,3,NA), y)
kge(rep(NA,20), y)
rmse(0,0, quiet=TRUE)
rsquare(1:6, tapply(chickwts$weight, chickwts$feed, mean) )

## Not run: 
##D  # time consuming Simulation
##D 
##D # sample size bias
##D x <- 1:1000
##D y <- x+rnorm(1000)
##D rmse(x,y) # 0.983
##D ssize <- rep(5:1000, 3)
##D sgofs <- sapply(ssize, function(n){i <- sample(1:1000,n); c(rsquare(x[i],y[i]),rmse(x[i],y[i]))})
##D plot(ssize, sgofs[2,]) # RMSE: no bias, symmetric convergence
##D plot(ssize, sgofs[1,]) # R2: small underestimation in small samples
##D 
##D if(require(pbapply)) sapply <- pbsapply
##D r2 <- sapply(1:10000, function(i){
##D    x <- rnorm(20);  y <- 2*x + rnorm(20);  c(rsquare(x,y), rmse(x,y)) })
##D hist(r2[1,], breaks=70, col=5,
##D main= "10'000 times   x <- rnorm(20);  y <- 2*x + rnorm(20);  rsquare(x,y)")
##D # For small samples, R^2 can by chance be far off the 'real' value!
##D hist(r2[2,], breaks=70, col=5, main= "... rsquare(x,y)")
##D # RMSE is more symmetric and gaussian
## End(Not run)

# NSE and KGE ---------------------------------------------------------------

y <- dbeta(1:40/40, 3, 10) # simulated
x <- y + rnorm(40,0,sd=0.2) # observed
plot(x)
lines(y, col="blue")
legGOF(25, 2)
rmse(x,y) ; rmse(y,x)
nse(x,y) ; nse(y,x)  # x=obs, y=sim  (second command is wrong)
kge(x,y) ; kge(y,x)





