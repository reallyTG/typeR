library(ctqr)


### Name: ctqr
### Title: Censored and Truncated Quantile Regression
### Aliases: ctqr
### Keywords: survival models regression

### ** Examples

# Using simulated data

n <- 1000
x1 <- runif(n)
x2 <- runif(n)

# Example 1 - censored data ######################################

t <- runif(n, 0, 1 + x1 + x2) # time variable (e.g., time to death)
c <- runif(n,0,5)             # censoring variable (e.g., end of follow-up)
y <- pmin(t,c) # observed variable = min(t,c)
d <- (t <= c)  # 1 = event (e.g., death), 0 = censored

CDF1 <- pchreg(Surv(y,d) ~ x1 + x2, splinex = splinex())
model1 <- ctqr(Surv(y,d) ~ x1 + x2, p = 0.5, CDF = CDF1)
model2 <- ctqr(Surv(y,d) ~ x1, p = 0.5, CDF = CDF1)

# model1 is identical to ctqr(Surv(y,d) ~ x1 + x2, p = 0.5)
# model2 is NOT identical to ctqr(Surv(y,d) ~ x1, p = 0.5), 
  # which would have default CDF = pchreg(Surv(y,d) ~ x1, splinex = splinex())


# Example 2 - censored and truncated data #########################

z <- rnorm(n) # truncation variable (e.g., time at enrollment)
w <- which(y > z) # data are only observed when y > z
z <- z[w]; y <- y[w]; d <- d[w]; x1 <- x1[w]; x2 <- x2[w]

# implement various CDFs and choose the model with smallest AIC

CDFs <- list(
  pchreg(Surv(z,y,d) ~ x1 + x2, breaks = 5),
  pchreg(Surv(z,y,d) ~ x1 + x2, breaks = 10),
  pchreg(Surv(z,y,d) ~ x1 + x2 + x1:x2, breaks = 5),
  pchreg(Surv(z,y,d) ~ x1 + x2 + x1^2 + x2^2, breaks = 10)
)

CDF <- CDFs[[which.min(sapply(CDFs, function(obj) AIC(obj)))]]
summary(ctqr(Surv(z,y,d) ~ x1 + x2, p = 0.5, CDF = CDF))




