library(cgam)


### Name: plotpersp
### Title: Create a 3D Plot for a CGAM Object
### Aliases: plotpersp
### Keywords: 3D plot routine

### ** Examples

# Example 1.
  data(FEV)

  # extract the variables
  y <- FEV$FEV
  age <- FEV$age
  height <- FEV$height
  sex <- FEV$sex
  smoke <- FEV$smoke

  fit <- cgam(y ~ incr(age) + incr(height) + factor(sex) + factor(smoke), nsim = 0)
  fit.s <- cgam(y ~ s.incr(age) + s.incr(height) + factor(sex) + factor(smoke), nsim = 0)

  plotpersp(fit, age, height, ngrid = 10, main = "Cgam Increasing Fit", 
  sub = "Categorical Variable: Sex", categ = "factor(sex)")
  plotpersp(fit.s, age, height, ngrid = 10, main = "Cgam Smooth Increasing Fit", 
  sub = "Categorical Variable: Smoke", categ = "factor(smoke)")

# Example 2.
  data(plasma)

  # extract the variables
  y <- plasma$logplasma
  bmi <- plasma$bmi
  logdietfat <- plasma$logdietfat
  cholest <- plasma$cholest
  fiber <- plasma$fiber
  betacaro <- plasma$betacaro
  retinol <- plasma$retinol
  smoke <- plasma$smoke
  vituse <- plasma$vituse

  fit <- cgam(y ~  s.decr(bmi) + s.decr(logdietfat) + s.decr(cholest) + s.incr(fiber) 
+ s.incr(betacaro) + s.incr(retinol) + factor(smoke) + factor(vituse)) 

  plotpersp(fit, bmi, logdietfat, ngrid = 15, th = 120, ylab = "log(dietfat)", 
zlab = "est mean of log(plasma)", main = "Cgam Fit with the Plasma Data Set", 
sub = "Categorical Variable: Vitamin Use", categ = "factor(vituse)")

# Example 3.
  data(plasma)
  addl <- 1:314*0 + 1 
  addl[runif(314) < .3] <- 2
  addl[runif(314) > .8] <- 4
  addl[runif(314) > .8] <- 3

  ans <- cgam(logplasma ~ s.incr(betacaro, 5) + s.decr(bmi) + s.decr(logdietfat) 
+ as.factor(addl), data = plasma)
  plotpersp(ans, betacaro, logdietfat, th = 240, random = TRUE, 
categ = "as.factor(addl)", data = plasma)

# Example 4.
  n <- 100
  set.seed(123)
  x1 <- sort(runif(n))
  x2 <- sort(runif(n))
  y <- 4 * (x1 - x2) + rnorm(n, sd = .5)

  # regress y on x1 and x2 under the shape-restriction: "decreasing-increasing"
  # with a penalty term = .1
  ans <- cgam(y ~ s.decr.incr(x1, x2), pen = .1)

# plot the constrained surface
  plotpersp(ans)



