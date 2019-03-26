library(VGAM)


### Name: binomialff
### Title: Binomial Family Function
### Aliases: binomialff
### Keywords: models regression

### ** Examples

shunua <- hunua[sort.list(with(hunua, altitude)), ]  # Sort by altitude
fit <- vglm(agaaus ~ poly(altitude, 2), binomialff(link = cloglog),
            data = shunua)
## Not run: 
##D plot(agaaus ~ jitter(altitude), shunua, ylab = "Pr(Agaaus = 1)",
##D      main = "Presence/absence of Agathis australis", col = 4, las = 1)
##D with(shunua, lines(altitude, fitted(fit), col = "orange", lwd = 2)) 
## End(Not run)


# Fit two species simultaneously
fit2 <- vgam(cbind(agaaus, kniexc) ~ s(altitude),
             binomialff(multiple.responses = TRUE), data = shunua)
## Not run: 
##D with(shunua, matplot(altitude, fitted(fit2), type = "l",
##D      main = "Two species response curves", las = 1)) 
## End(Not run)


# Shows that Fisher scoring can sometime fail. See Ridout (1990).
ridout <- data.frame(v = c(1000, 100, 10), r = c(4, 3, 3), n = rep(5, 3))
(ridout <- transform(ridout, logv = log(v)))
# The iterations oscillates between two local solutions:
glm.fail <- glm(r / n ~ offset(logv) + 1, weight = n,
               binomial(link = 'cloglog'), ridout, trace = TRUE)
coef(glm.fail)
# vglm()'s half-stepping ensures the MLE of -5.4007 is obtained:
vglm.ok <- vglm(cbind(r, n-r) ~ offset(logv) + 1,
               binomialff(link = cloglog), ridout, trace = TRUE)
coef(vglm.ok)


# Separable data
set.seed(123)
threshold <- 0
bdata <- data.frame(x2 = sort(rnorm(nn <- 100)))
bdata <- transform(bdata, y1 = ifelse(x2 < threshold, 0, 1))
fit <- vglm(y1 ~ x2, binomialff(bred = TRUE),
            data = bdata, criter = "coef", trace = TRUE)
coef(fit, matrix = TRUE)  # Finite!!
summary(fit)
## Not run: 
##D  plot(depvar(fit) ~ x2, data = bdata, col = "blue", las = 1)
##D lines(fitted(fit) ~ x2, data = bdata, col = "orange")
##D abline(v = threshold, col = "gray", lty = "dashed") 
## End(Not run)



