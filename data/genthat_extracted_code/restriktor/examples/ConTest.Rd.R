library(restriktor)


### Name: conTest
### Title: function for informative hypothesis testing (iht)
### Aliases: conTest iht

### ** Examples

## example 1:
# the data consist of ages (in months) at which an 
# infant starts to walk alone.

# prepare data
DATA1 <- subset(ZelazoKolb1972, Group != "Control")

# fit unrestricted linear model
fit1.lm <- lm(Age ~ -1 + Group, data = DATA1)

# the variable names can be used to impose constraints on
# the corresponding regression parameters.
coef(fit1.lm)

# constraint syntax: assuming that the walking 
# exercises would not have a negative effect of increasing the 
# mean age at which a child starts to walk. 
myConstraints1 <- ' GroupActive  < GroupPassive; 
                    GroupPassive < GroupNo '

conTest(fit1.lm, myConstraints1)


# another way is to first fit the restricted model
fit.restr1 <- restriktor(fit1.lm, constraints = myConstraints1)

conTest(fit.restr1)

## Not run: 
##D  
##D   # Or in matrix notation.
##D   Amat1 <- rbind(c(-1, 0,  1),
##D                  c( 0, 1, -1))
##D   myRhs1 <- rep(0L, nrow(Amat1)) 
##D   myNeq1 <- 0
##D   
##D   conTest(fit1.lm, constraints = Amat1,
##D           rhs = myRhs1, neq = myNeq1)
## End(Not run)            

#########################
## Artificial examples ##
#########################
# generate data
n <- 10
means <- c(1,2,1,3)
nm <- length(means)
group <- as.factor(rep(1:nm, each = n))
y <- rnorm(n * nm, rep(means, each = n))
DATA2 <- data.frame(y, group)

# fit unrestricted linear model
fit2.lm <- lm(y ~ -1 + group, data = DATA2)
coef(fit2.lm)

## example 2: increasing means
myConstraints2 <- ' group1 < group2
                    group2 < group3
                    group3 < group4 '

# compute F-test for hypothesis test Type A and compute the tail 
# probability based on the parametric bootstrap. We only generate 9 
# bootstrap samples in this example; in practice you may wish to 
# use a much higher number.
conTest(fit2.lm, constraints = myConstraints2, type = "A", 
        boot = "parametric", R = 9)


# or fit restricted linear model
fit2.con <- restriktor(fit2.lm, constraints = myConstraints2)

conTest(fit2.con)

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
##D           type = "A", boot = "parametric", R = 9)
## End(Not run)            

## example 3: equality constraints only.
myConstraints3 <- ' group1 == group2
                    group2 == group3
                    group3 == group4 '

conTest(fit2.lm, constraints = myConstraints3)

# or
fit3.con <- restriktor(fit2.lm, constraints = myConstraints3)
conTest(fit3.con)


## example 4:
# combination of equality and inequality constraints.
myConstraints4 <- ' group1 == group2
                    group3  < group4 '

conTest(fit2.lm, constraints = myConstraints4, type = "B", neq.alt = 1)

# fit resticted model and compute model-based bootstrapped 
# standard errors. We only generate 9 bootstrap samples in this 
# example; in practice you may wish to use a much higher number.
# Note that, a warning message may be thrown because the number of 
# bootstrap samples is too low.
fit4.con <- restriktor(fit2.lm, constraints = myConstraints4, 
                       se = "boot.model.based", B = 9)
conTest(fit4.con, type = "B", neq.alt = 1)


## example 5:
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
fit5.lm <- lm(y ~ X*Z, data = DATA3)

# constraint syntax
myConstraints5 <- ' AVE := X + 16.86137*X.Z; 
                    AVE > 0 '

conTest(fit5.lm, constraints = myConstraints5)

# or
fit5.con <- restriktor(fit5.lm, constraints = ' AVE := X + 16.86137*X.Z; 
                                                AVE > 0 ')
conTest(fit5.con)



