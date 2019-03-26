library(VGAM)


### Name: tobit
### Title: Tobit Model
### Aliases: tobit
### Keywords: models regression

### ** Examples

# Here, fit1 is a standard Tobit model and fit2 is a nonstandard Tobit model
tdata <- data.frame(x2 = seq(-1, 1, length = (nn <- 100)))
set.seed(1)
Lower <- 1; Upper <- 4  # For the nonstandard Tobit model
tdata <- transform(tdata,
                   Lower.vec = rnorm(nn, Lower, 0.5),
                   Upper.vec = rnorm(nn, Upper, 0.5))
meanfun1 <- function(x) 0 + 2*x
meanfun2 <- function(x) 2 + 2*x
meanfun3 <- function(x) 2 + 2*x
meanfun4 <- function(x) 3 + 2*x
tdata <- transform(tdata,
  y1 = rtobit(nn, mean = meanfun1(x2)),  # Standard Tobit model
  y2 = rtobit(nn, mean = meanfun2(x2), Lower = Lower, Upper = Upper),
  y3 = rtobit(nn, mean = meanfun3(x2), Lower = Lower.vec, Upper = Upper.vec),
  y4 = rtobit(nn, mean = meanfun3(x2), Lower = Lower.vec, Upper = Upper.vec))
with(tdata, table(y1 == 0))  # How many censored values?
with(tdata, table(y2 == Lower | y2 == Upper))  # How many censored values?
with(tdata, table(attr(y2, "cenL")))
with(tdata, table(attr(y2, "cenU")))

fit1 <- vglm(y1 ~ x2, tobit, data = tdata, trace = TRUE)
coef(fit1, matrix = TRUE)
summary(fit1)

fit2 <- vglm(y2 ~ x2, tobit(Lower = Lower, Upper = Upper, type.f = "cens"),
             data = tdata, trace = TRUE)
table(fit2@extra$censoredL)
table(fit2@extra$censoredU)
coef(fit2, matrix = TRUE)

fit3 <- vglm(y3 ~ x2, tobit(Lower = with(tdata, Lower.vec),
                            Upper = with(tdata, Upper.vec), type.f = "cens"),
             data = tdata, trace = TRUE)
table(fit3@extra$censoredL)
table(fit3@extra$censoredU)
coef(fit3, matrix = TRUE)

# fit4 is fit3 but with type.fitted = "uncen".
fit4 <- vglm(cbind(y3, y4) ~ x2,
             tobit(Lower = rep(with(tdata, Lower.vec), each = 2),
                   Upper = rep(with(tdata, Upper.vec), each = 2),
                   byrow.arg = TRUE),
             data = tdata, crit = "coeff", trace = TRUE)
head(fit4@extra$censoredL)  # A matrix
head(fit4@extra$censoredU)  # A matrix
head(fit4@misc$Lower)       # A matrix
head(fit4@misc$Upper)       # A matrix
coef(fit4, matrix = TRUE)

## Not run: 
##D  # Plot fit1--fit4
##D par(mfrow = c(2, 2))
##D 
##D plot(y1 ~ x2, tdata, las = 1, main = "Standard Tobit model",
##D      col = as.numeric(attr(y1, "cenL")) + 3,
##D      pch = as.numeric(attr(y1, "cenL")) + 1)
##D legend(x = "topleft", leg = c("censored", "uncensored"),
##D        pch = c(2, 1), col = c("blue", "green"))
##D legend(-1.0, 2.5, c("Truth", "Estimate", "Naive"),
##D        col = c("purple", "orange", "black"), lwd = 2, lty = c(1, 2, 2))
##D lines(meanfun1(x2) ~ x2, tdata, col = "purple", lwd = 2)
##D lines(fitted(fit1) ~ x2, tdata, col = "orange", lwd = 2, lty = 2)
##D lines(fitted(lm(y1 ~ x2, tdata)) ~ x2, tdata, col = "black",
##D       lty = 2, lwd = 2)  # This is simplest but wrong!
##D 
##D plot(y2 ~ x2, data = tdata, las = 1, main = "Tobit model",
##D      col = as.numeric(attr(y2, "cenL")) + 3 +
##D            as.numeric(attr(y2, "cenU")),
##D      pch = as.numeric(attr(y2, "cenL")) + 1 +
##D            as.numeric(attr(y2, "cenU")))
##D legend(x = "topleft", leg = c("censored", "uncensored"),
##D        pch = c(2, 1), col = c("blue", "green"))
##D legend(-1.0, 3.5, c("Truth", "Estimate", "Naive"),
##D        col = c("purple", "orange", "black"), lwd = 2, lty = c(1, 2, 2))
##D lines(meanfun2(x2) ~ x2, tdata, col = "purple", lwd = 2)
##D lines(fitted(fit2) ~ x2, tdata, col = "orange", lwd = 2, lty = 2)
##D lines(fitted(lm(y2 ~ x2, tdata)) ~ x2, tdata, col = "black",
##D       lty = 2, lwd = 2)  # This is simplest but wrong!
##D 
##D plot(y3 ~ x2, data = tdata, las = 1,
##D      main = "Tobit model with nonconstant censor levels",
##D      col = as.numeric(attr(y3, "cenL")) + 2 +
##D            as.numeric(attr(y3, "cenU") * 2),
##D      pch = as.numeric(attr(y3, "cenL")) + 1 +
##D            as.numeric(attr(y3, "cenU") * 2))
##D legend(x = "topleft", leg = c("censoredL", "censoredU", "uncensored"),
##D        pch = c(2, 3, 1), col = c(3, 4, 2))
##D legend(-1.0, 3.5, c("Truth", "Estimate", "Naive"),
##D        col = c("purple", "orange", "black"), lwd = 2, lty = c(1, 2, 2))
##D lines(meanfun3(x2) ~ x2, tdata, col = "purple", lwd = 2)
##D lines(fitted(fit3) ~ x2, tdata, col = "orange", lwd = 2, lty = 2)
##D lines(fitted(lm(y3 ~ x2, tdata)) ~ x2, tdata, col = "black",
##D       lty = 2, lwd = 2)  # This is simplest but wrong!
##D 
##D plot(y3 ~ x2, data = tdata, las = 1,
##D      main = "Tobit model with nonconstant censor levels",
##D      col = as.numeric(attr(y3, "cenL")) + 2 +
##D            as.numeric(attr(y3, "cenU") * 2),
##D      pch = as.numeric(attr(y3, "cenL")) + 1 +
##D            as.numeric(attr(y3, "cenU") * 2))
##D legend(x = "topleft", leg = c("censoredL", "censoredU", "uncensored"),
##D        pch = c(2, 3, 1), col = c(3, 4, 2))
##D legend(-1.0, 3.5, c("Truth", "Estimate", "Naive"),
##D        col = c("purple", "orange", "black"), lwd = 2, lty = c(1, 2, 2))
##D lines(meanfun3(x2) ~ x2, data = tdata, col = "purple", lwd = 2)
##D lines(fitted(fit4)[, 1] ~ x2, tdata, col = "orange", lwd = 2, lty = 2)
##D lines(fitted(lm(y3 ~ x2, tdata)) ~ x2, data = tdata, col = "black",
##D       lty = 2, lwd = 2)  # This is simplest but wrong!
## End(Not run)



