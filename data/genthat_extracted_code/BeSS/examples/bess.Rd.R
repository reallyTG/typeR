library(BeSS)


### Name: bess
### Title: Best subset selection
### Aliases: bess

### ** Examples

#--------------linear model--------------#
# Generate simulated data
n <- 500
p <- 20
K <-10
sigma <- 1
rho <- 0.2
data <- gen.data(n, p, family = "gaussian", K, rho, sigma)

# Best subset selection
fit1 <- bess(data$x, data$y, family = "gaussian")
print(fit1)
#coef(fit1, sparse=TRUE)  # The estimated coefficients
bestmodel <- fit1$bestmodel
#summary(bestmodel)

# Plot solution path and the loss function
plot(fit1, type = "both", breaks = TRUE)

## Not run:
#--------------logistic model--------------#

# Generate simulated data
data <- gen.data(n, p, family="binomial", 5, rho, sigma)

# Best subset selection
fit2 <- bess(data$x, data$y, s.list = 1:10, method = "sequential",
             family = "binomial", epsilon = 0)
print(fit2)
#coef(fit2, sparse = TRUE)
bestmodel <- fit2$bestmodel
#summary(bestmodel)

# Plot solution path and the loss function
plot(fit2, type = "both", breaks = TRUE, K = 5)

#--------------cox model--------------#

# Generate simulated data
data <- gen.data(n, p, 5, rho, sigma, c = 10, family = "cox", scal = 10)

# Best subset selection
fit3 <- bess(data$x, data$y, s.list = 1:10, method = "sequential",
             family = "cox")
print(fit3)
#coef(fit3, sparse = TRUE)
bestmodel <- fit3$bestmodel
#summary(bestmodel)

# Plot solution path and the loss function
plot(fit3, type = "both", breaks = TRUE, K = 5)


#----------------------High dimensional linear models--------------------#

p <- 1000
data <- gen.data(n, p, family = "gaussian", K, rho, sigma)

# Best subset selection
fit <- bess(data$x, data$y, method="sequential", family = "gaussian", epsilon = 1e-12)

# Plot solution path
plot(fit, type = "both", breaks = TRUE, K = 10)


data("prostate")
x = prostate[,-9]
y = prostate[,9]

fit.group = bess(x, y, s.list = 1:ncol(x), factor = c("gleason"))


#---------------SAheart---------------#
data("SAheart")
y = SAheart[,5]
x = SAheart[,-5]
x$ldl[x$ldl<5] = 1
x$ldl[x$ldl>=5&x$ldl<10] = 2
x$ldl[x$ldl>=10] = 3

fit.group = bess(x, y, s.list = 1:ncol(x), factor = c("ldl"), family = "binomial")
## End(Not run)



