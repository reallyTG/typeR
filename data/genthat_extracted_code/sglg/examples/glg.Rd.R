library(sglg)


### Name: glg
### Title: Fitting multiple linear Generalized Log-gamma Regression Models
### Aliases: glg

### ** Examples

rows <- 200
columns <- 2
x1 <- rbinom(rows, 1, 0.5)
x2 <- runif(columns, 0, 1)
X <- cbind(x1,x2)
t_beta  <- c(0.5, 2)
t_sigma <- 1

######################
#                    #
# Extreme value case #
#                    #
######################

t_lambda <- 1
set.seed(8142031)
error <- rglg(rows, 0, 1, t_lambda)
y1 <- X %*%t_beta + t_sigma * error
data.example <- data.frame(y1,X)
fit1 <- glg(y1 ~ x1 + x2 - 1,data=data.example)
summary(fit1)
plot(fit1)

###############
#             #
# Normal case #
#             #
###############

t_lambda <- 0.001
set.seed(8142031)
error <- rglg(rows, 0, 1, t_lambda)
y1 <- X %*%t_beta + t_sigma * error
data.example <- data.frame(y1, X)
fit0 <- glg(y1 ~ x1 + x2 - 1,data=data.example)
logLik(fit0)
fit0$AIC
fit0$mu

############################################
#                                          #
#  A comparison with a normal linear model #
#                                          #
############################################

fit2 <- lm(y1 ~ x1 + x2 - 1,data=data.example)
logLik(fit2)
AIC(fit2)
coefficients(fit2)




