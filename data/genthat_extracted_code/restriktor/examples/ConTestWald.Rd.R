library(restriktor)


### Name: conTestWald
### Title: Wald-bar test for robust iht
### Aliases: conTestWald conTestWald.conRLM

### ** Examples

library(MASS)
## example 1:
# the data consist of ages (in months) at which an 
# infant starts to walk alone.

# prepare data
DATA1 <- subset(ZelazoKolb1972, Group != "Control")

# fit unrestricted robust linear model
fit1.rlm <- rlm(Age ~ -1 + Group, data = DATA1, method = "MM")

# the variable names can be used to impose constraints on
# the corresponding regression parameters.
coef(fit1.rlm)

# constraint syntax: assuming that the walking 
# exercises would not have a negative effect of increasing the 
# mean age at which a child starts to walk. 
myConstraints1 <- ' GroupActive  < GroupPassive; 
                    GroupPassive < GroupNo '

conTest(fit1.rlm, myConstraints1, test = "Wald")


# another way is to first fit the restricted model
fit.restr1 <- restriktor(fit1.rlm, constraints = myConstraints1)

conTest(fit.restr1, test = "Wald")

## Not run: 
##D  
##D   # Or in matrix notation.
##D   Amat1 <- rbind(c(-1, 0,  1),
##D                  c( 0, 1, -1))
##D   myRhs1 <- rep(0L, nrow(Amat1)) 
##D   myNeq1 <- 0
##D   
##D   conTest(fit1.rlm, constraints = Amat1, test = "Wald",
##D           rhs = myRhs1, neq = myNeq1)
## End(Not run)            

#########################
## Artificial examples ##
#########################
# generate data
n <- 30
means <- c(1,2,1,3)
nm <- length(means)
group <- as.factor(rep(1:nm, each = n))
y <- rnorm(n * nm, rep(means, each = n))
DATA2 <- data.frame(y, group)

# fit unrestricted robust linear model
fit2.rlm <- rlm(y ~ -1 + group, data = DATA2, method = "MM")
coef(fit2.rlm)

## example 2: increasing means
myConstraints2 <- ' group1 < group2
                    group2 < group3
                    group3 < group4 '

# compute Wald-test for hypothesis test Type A and compute the tail 
# probability based on the parametric bootstrap. We only generate 9 
# bootstrap samples in this example; in practice you may wish to 
# use a much higher number.
conTest(fit2.rlm, constraints = myConstraints2, type = "A", 
        test = "Wald", boot = "parametric", R = 9)


# or fit restricted robust linear model
fit2.con <- restriktor(fit2.rlm, constraints = myConstraints2)

conTest(fit2.con, test = "Wald")

## Not run: 
##D  
##D   # increasing means in matrix notation.
##D   Amat2 <- rbind(c(-1, 1, 0, 0),
##D                  c( 0,-1, 1, 0),
##D                  c( 0, 0,-1, 1))
##D   myRhs2 <- rep(0L, nrow(Amat2)) 
##D   myNeq2 <- 0
##D 
##D   conTest(fit2.con, constraints = Amat2, rhs = myRhs2, neq = myNeq2, 
##D           type = "A", test = "Wald", boot = "parametric", R = 9)
## End(Not run)            

## example 3:
# combination of equality and inequality constraints.
myConstraints3 <- ' group1 == group2
                    group3  < group4 '

conTest(fit2.rlm, constraints = myConstraints3, type = "B", test = "Wald", neq.alt = 1)

# fit robust resticted model and compute model-based bootstrapped 
# standard errors. We only generate 9 bootstrap samples in this 
# example; in practice you may wish to use a much higher number.
# Note that, a warning message may be thrown because the number of 
# bootstrap samples is too low.
fit3.con <- restriktor(fit2.rlm, constraints = myConstraints3, 
                       se = "boot.model.based", B = 9)
conTest(fit3.con, type = "B", test = "Wald", neq.alt = 1)


## example 4:
# restriktor can also be used to define effects using the := operator 
# and impose constraints on them. For example, is the 
# average effect (AVE) larger than zero?
# generate data
n <- 30
b0 <- 10; b1 = 0.5; b2 = 1; b3 = 1.5
X <- c(rep(c(0), n/2), rep(c(1), n/2))
set.seed(90) 
Z <- rnorm(n, 16, 5)
y <- b0 + b1*X + b2*Z + b3*X*Z + rnorm(n, 0, sd = 10) 
DATA3 = data.frame(cbind(y, X, Z))

# fit linear model with interaction
fit3.rlm <- rlm(y ~ X*Z, data = DATA3, method = "MM")

# constraint syntax
myConstraints4 <- ' AVE := X + 16.86137*X.Z; 
                    AVE > 0 '

conTest(fit3.rlm, constraints = myConstraints4, test = "Wald")

# or
fit3.con <- restriktor(fit3.rlm, constraints = ' AVE := X + 16.86137*X.Z; 
                                                 AVE > 0 ')
conTest(fit3.con, test = "Wald")



