library(VGAM)


### Name: dirmultinomial
### Title: Fitting a Dirichlet-Multinomial Distribution
### Aliases: dirmultinomial
### Keywords: models regression

### ** Examples

nn <- 5; M <- 4; set.seed(1)
ydata <- data.frame(round(matrix(runif(nn * M, max = 100), nn, M)))  # Integer counts
colnames(ydata) <- paste("y", 1:M, sep = "")

fit <- vglm(cbind(y1, y2, y3, y4) ~ 1, dirmultinomial,
            data = ydata, trace = TRUE)
head(fitted(fit))
depvar(fit)  # Sample proportions
weights(fit, type = "prior", matrix = FALSE)  # Total counts per row

## Not run: 
##D ydata <- transform(ydata, x2 = runif(nn))
##D fit <- vglm(cbind(y1, y2, y3, y4) ~ x2, dirmultinomial,
##D             data = ydata, trace = TRUE)
##D Coef(fit)
##D coef(fit, matrix = TRUE)
##D (sfit <- summary(fit))
##D vcov(sfit)
## End(Not run)



