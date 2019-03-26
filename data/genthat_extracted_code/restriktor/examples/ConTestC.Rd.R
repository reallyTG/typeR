library(restriktor)


### Name: conTestC
### Title: one-sided t-test for iht
### Aliases: conTestC conTestC.restriktor

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

conTest(fit1.lm, myConstraints1, type = "C")


# another way is to first fit the restricted model
fit.restr1 <- restriktor(fit1.lm, constraints = myConstraints1)

conTest(fit.restr1, type = "C")

## Not run: 
##D  
##D   # Or in matrix notation.
##D   Amat1 <- rbind(c(-1, 0,  1),
##D                  c( 0, 1, -1))
##D   myRhs1 <- rep(0L, nrow(Amat1)) 
##D   myNeq1 <- 0
##D   
##D   fit1.con <- restriktor(fit1.lm, constraints = Amat1,
##D                          rhs = myRhs1, neq = myNeq1)
##D   conTest(fit1.con, type = "C")
## End(Not run)            




