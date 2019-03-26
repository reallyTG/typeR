library(restriktor)


### Name: restriktor
### Title: Estimating linear regression models with (in)equality
###   restrictions
### Aliases: restriktor conLM.lm conRLM.rlm conGLM.glm conMLM.mlm

### ** Examples

## lm
## unrestricted linear model for ages (in months) at which an 
## infant starts to walk alone.

# prepare data
DATA1 <- subset(ZelazoKolb1972, Group != "Control")

# fit unrestricted linear model
fit1.lm <- lm(Age ~ -1 + Group, data = DATA1)

# the variable names can be used to impose restrictions on
# the corresponding regression parameters.
coef(fit1.lm)

# restricted linear model with restrictions that the walking 
# exercises would not have a negative effect of increasing the 
# mean age at which a child starts to walk. 
fit1.con <- restriktor(fit1.lm, constraints = ' GroupActive  < GroupPassive; 
                                                GroupPassive < GroupNo ')
summary(fit1.con)

## Not run: 
##D  
##D # Or in matrix notation.
##D myConstraints1 <- rbind(c(-1, 1, 0),
##D                         c( 0,-1, 1))
##D myRhs1 <- rep(0L, nrow(R1)) 
##D myNeq1 <- 0
##D 
##D fit1.con <- restriktor(fit1.lm, constraints = myConstraints1,
##D                        rhs = myRhs1, neq = myNeq1)
##D summary(fit1.con)
## End(Not run)            

#########################
## Artificial examples ##
#########################
library(MASS)

## mlm
# generate data
n <- 30
mu <- rep(0, 4)
Sigma <- matrix(5,4,4)
  diag(Sigma) <- c(10,10,10,10)
# 4 Y's.
Y <- mvrnorm(n, mu, Sigma)

# fit unrestricted multivariate linear model
fit.mlm <- lm(Y ~ 1)

# constraints
myConstraints2 <- diag(0,4)
  diag(myConstraints2) <- 1

# fit restricted multivariate linear model
fit2.con <- restriktor(fit.mlm, constraints = myConstraints2)

summary(fit2.con)


## rlm
# generate data
n <- 10
means <- c(1,2,1,3)
nm <- length(means)
group <- as.factor(rep(1:nm, each = n))
y <- rnorm(n * nm, rep(means, each = n))
DATA2 <- data.frame(y, group)

# fit unrestricted robust linear model
fit3.rlm <- rlm(y ~ -1 + group, data = DATA2, method = "MM")
coef(fit3.rlm)

## increasing means
myConstraints3 <- ' group1 < group2
                    group2 < group3
                    group3 < group4 '

# fit restricted robust linear model and compute 
# Huber-White (robust) standard errors.
fit3.con <- restriktor(fit3.rlm, constraints = myConstraints2, 
                       se = "HC0")
summary(fit3.con)

## Not run: 
##D  
##D ## increasing means in matrix notation.
##D myConstraints3 <- rbind(c(-1, 1, 0, 0),
##D                         c( 0,-1, 1, 0),
##D                         c( 0, 0,-1, 1))
##D myRhs3 <- rep(0L, nrow(myConstraints3)) 
##D myNeq2 <- 0
##D 
##D fit3.con <- restriktor(fit3.rlm, constraints = myConstraints3,
##D                        rhs = myRhs2, neq = myNeq2, se = "HC0")
##D summary(fit3.con)
## End(Not run)            

## equality restrictions only.
myConstraints4 <- ' group1 == group2
                    group2 == group3
                    group3 == group4 '
                    
fit4.con <- restriktor(fit3.rlm, constraints = myConstraints4)
summary(fit4.con)


## combination of equality and inequality restrictions.
myConstraints5 <- ' group1 == group2
                    group3  < group4 '

# fit restricted model and compute model-based bootstrapped 
# standard errors. We only generate 9 bootstrap samples in this 
# example; in practice you may wish to use a much higher number.
fit5.con <- restriktor(fit3.rlm, constraints = myConstraints4, 
                       se = "boot.model.based", B = 9)
# an error is probably thrown, due to a too low number of bootstrap draws.
summary(fit5.con)

# restriktor can also be used to define effects using the := operator 
# and impose restrictions on them. For example, compute the average 
# effect (AVE) and impose the restriction AVE > 0.
# generate data
n <- 30
b0 <- 10; b1 = 0.5; b2 = 1; b3 = 1.5
X <- c(rep(c(0), n/2), rep(c(1), n/2))
set.seed(90) 
Z <- rnorm(n, 16, 5)
y <- b0 + b1*X + b2*Z + b3*X*Z + rnorm(n, 0, sd = 10) 
DATA3 = data.frame(cbind(y, X, Z))

# fit linear model with interaction
fit6.lm <- lm(y ~ X*Z, data = DATA3)

fit6.con <- restriktor(fit6.lm, constraints = ' AVE := X + 16.86137*X.Z; 
                                                AVE > 0 ')
summary(fit6.con)



