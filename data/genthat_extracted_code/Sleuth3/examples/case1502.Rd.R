library(Sleuth3)


### Name: case1502
### Title: Global Warming
### Aliases: case1502
### Keywords: datasets

### ** Examples

str(case1502)
attach(case1502)

## EXPLORATION AND MODEL BUILDING
plot(Temperature ~ Year, type="b")  # Type = "b" for *both* points and lines

yearSquared <- Year^2
yearCubed <- Year^3
myLm1 <- lm(Temperature ~ Year + yearSquared + yearCubed)
res1 <- myLm1$res
myPacf <- pacf(res1)  # Partial autocorrelation from residuals
r1 <- myPacf$acf[1]  #First serial correlation coefficient    
n <- length(Temperature)   # Series length = 161
v <- Temperature[2:n]  -  r1*Temperature[1:(n-1)]   # Filtered response
ones <- rep(1-r1, n-1)   # make a variable of all 1's
u1 <- Year[2:n]          -  r1*Year[1:(n-1)]   # Filtered "ones"
u2 <- yearSquared[2:n]  -  r1*yearSquared[1:(n-1)]  # Filtered X1
u3 <- yearCubed[2:n]    -  r1*yearCubed[1:(n-1)]  # Filtered X2
myLm2 <- lm(v ~  u1 + u2 + u3 )
res2 <- myLm2$res                                       
pacf(res2)   # Looks fine; don't worry about lag 4 marginal significance
plot(myLm2, which=1)  # Residual plot
summary(myLm2) # Cubic term isn't needed.
myLm3    <- update(myLm2, ~ . - u3) # Drop cubic term

## INFERENCE
summary(myLm3) # Everything remaining is statistically significant.

## GRAPHICAL DISPLAY FOR PRESENTATION
plot(Temperature ~ Year, xlab="Year",
  ylab=expression(paste("Annual Average Temperature (Difference From Average), ",
  degree,"C")),main="Annual Average Temperature in Northern Hemisphere; 1850-2010",
  type="b", pch=21, lwd=2, bg="green", cex=1.5)    
myFits <- myLm3$fit
lines(myFits ~ Year[2:161], col="blue", lwd=2)  
legend(1850,0.6,"Quadratic Regression Fit, Adjusted for AR(1) Serial Correlation",
  col="blue", lwd=2, box.lty=0)

detach(case1502)




