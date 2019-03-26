library(BeSS)


### Name: bess.one
### Title: Best subset selection with a specified model size
### Aliases: bess.one

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
fit1 <- bess.one(data$x, data$y, s = 10, family = "gaussian", normalize = TRUE)
#coef(fit1,sparse=TRUE)
bestmodel <- fit1$bestmodel
#summary(bestmodel)

## Not run: 
#--------------logistic model--------------#

# Generate simulated data
data <- gen.data(n, p, family = "binomial", K, rho, sigma)

# Best subset selection
fit2 <- bess.one(data$x, data$y, family = "binomial", s = 10, normalize = TRUE)
bestmodel <- fit2$bestmodel
#summary(bestmodel)

#--------------cox model--------------#

# Generate simulated data
data <- gen.data(n, p, K, rho, sigma, c=10, family="cox", scal=10)

# Best subset selection
fit3 <- bess.one(data$x, data$y, s = 10, family = "cox", normalize = TRUE)
bestmodel <- fit3$bestmodel
#summary(bestmodel)

#----------------------High dimensional linear models--------------------#

p <- 1000
data <- gen.data(n, p, family = "gaussian", K, rho, sigma)

# Best subset selection
fit <- bess.one(data$x, data$y, s=10, family = "gaussian", normalize = TRUE)

#---------------prostate---------------#
data("prostate")
x = prostate[,-9]
y = prostate[,9]

fit.ungroup = bess.one(x, y, s=5)
fit.group = bess.one(x, y, s=5, factor = c("gleason"))

#---------------SAheart---------------#
data(SAheart)
y = SAheart[,5]
x = SAheart[,-5]
x$ldl[x$ldl<5] = 1
x$ldl[x$ldl>=5&x$ldl<10] = 2
x$ldl[x$ldl>=10] = 3

fit.ungroup = bess.one(x, y, s=5, family = "binomial")
fit.group = bess.one(x, y, s=5, factor = c("ldl"), family = "binomial")
## End(Not run)



