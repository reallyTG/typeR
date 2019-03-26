library(stable)


### Name: stablereg
### Title: Stable Generalized Regression Models
### Aliases: aic.stable deviance.stable df.residual.stable fitted.stable
###   stablereg
### Keywords: models

### ** Examples


## Share return over a 50 day period (see reference above)
# shares
y <- c(296,296,300,302,300,304,303,299,293,294,294,293,295,287,288,297,
305,307,307,304,303,304,304,309,309,309,307,306,304,300,296,301,298,
295,295,293,292,297,294,293,306,303,301,303,308,305,302,301,297,299)  

# returns
ret <- (y[2:50]-y[1:49])/y[1:49]
# hist(ret, breaks=seq(-0.035,0.045,0.01))

day <- seq(0,0.48,by=0.01) # time measured in days/100
x <- seq(1,length(ret))-1

# Classic stationary normal model tail=2
print(z1 <- stablereg(y = ret, delta = 1/y[1:49],
	loc = ~1, disp= ~1, skew = ~1, tail = tail_g(1.9999999),
	iloc = 0, idisp = -3, iskew = 0, oskew = FALSE, otail = FALSE))

# Normal model (tail=2) with dispersion=disp_h(b0+b1*day)
print(z2 <- stablereg(y = ret, delta = 1/y[1:49], loc = ~day,
	disp = ~1, skew = ~1, tail = tail_g(1.999999), iloc = c(0.003,0),
	idisp = -4.5, iskew = 0, oskew = FALSE, otail = FALSE))

# Stable model with loc(ation)=loc_h(b0+b1*day)
print(z3 <- stablereg(y = ret, delta = 1/y[1:49],
	loc = ~day, disp = ~1, skew = ~1, tail = ~1,
	iloc = c(0.001,-0.004), idisp = -4.8, iskew = 0, itail = 0.6))

# Stable model with disp(ersion)=disp_h(b0+b1*day)
print(z4 <- stablereg(y = ret, delta = 1/y[1:49],
	loc = ~1, disp = ~day, skew = ~1, tail = ~1,
	iloc = 0.003, idisp = c(-4.8,0), iskew = -0.03, itail = 1.6))

# Stable model with skew(ness)=skew_h(b0+b1*day)
# Evaluation at fixed parameter values (because noopt is set to TRUE)
print(z5 <- stablereg(y = ret, delta = 1/y[1:49],
	loc = ~1, disp = ~1, skew = ~day, tail = ~1,
	iloc = 5.557e-04, idisp = -4.957, iskew = c(2.811,-2.158),
	itail = 1.57, noopt=TRUE))

# Stable model with tail=tail_h(b0+b1*day)
print(z6 <- stablereg(y = ret, delta = 1/y[1:49], loc = ret ~ 1,
	disp = ~1, skew = ~1, tail = ~day, iloc = 0.002,
	idisp = -4.8, iskew = -2, itail = c(2.4,-4), hessian=FALSE))




