library(VGAM)


### Name: vgam
### Title: Fitting Vector Generalized Additive Models
### Aliases: vgam
### Keywords: models regression smooth

### ** Examples
# Nonparametric proportional odds model
pneumo <- transform(pneumo, let = log(exposure.time))
vgam(cbind(normal, mild, severe) ~ s(let),
     cumulative(parallel = TRUE), data = pneumo, trace = TRUE)

# Nonparametric logistic regression
hfit <- vgam(agaaus ~ s(altitude, df = 2), binomialff, data = hunua)
## Not run:  plot(hfit, se = TRUE) 
phfit <- predict(hfit, type = "terms", raw = TRUE, se = TRUE)
names(phfit)
head(phfit$fitted)
head(phfit$se.fit)
phfit$df
phfit$sigma

# Fit two species simultaneously
hfit2 <- vgam(cbind(agaaus, kniexc) ~ s(altitude, df = c(2, 3)),
              binomialff(multiple.responses = TRUE), data = hunua)
coef(hfit2, matrix = TRUE)  # Not really interpretable
## Not run: 
##D plot(hfit2, se = TRUE, overlay = TRUE, lcol = 3:4, scol = 3:4)
##D ooo <- with(hunua, order(altitude))
##D with(hunua, matplot(altitude[ooo], fitted(hfit2)[ooo,], ylim = c(0, 0.8),
##D      xlab = "Altitude (m)", ylab = "Probability of presence", las = 1,
##D      main = "Two plant species' response curves", type = "l", lwd = 2))
##D with(hunua, rug(altitude))
## End(Not run)

# The 'subset' argument does not work here. Use subset() instead.
set.seed(1)
zdata <- data.frame(x2 = runif(nn <- 500))
zdata <- transform(zdata, y = rbinom(nn, 1, 0.5))
zdata <- transform(zdata, subS = runif(nn) < 0.7)
sub.zdata <- subset(zdata, subS)  # Use this instead
if (FALSE)
  fit4a <- vgam(cbind(y, y) ~ s(x2, df = 2),
                binomialff(multiple.responses = TRUE),
                data = zdata, subset = subS)  # This fails!!!
fit4b <- vgam(cbind(y, y) ~ s(x2, df = 2),
              binomialff(multiple.responses = TRUE),
              data = sub.zdata)  # This succeeds!!!
fit4c <- vgam(cbind(y, y) ~ sm.os(x2),
              binomialff(multiple.responses = TRUE),
              data = sub.zdata)  # This succeeds!!!
## Not run: 
##D par(mfrow = c(2, 2))
##D plot(fit4b, se = TRUE, shade = TRUE, shcol = "pink")
##D plot(fit4c, se = TRUE, shade = TRUE, shcol = "pink")
## End(Not run)



