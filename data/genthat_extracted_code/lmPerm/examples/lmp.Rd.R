library(lmPerm)


### Name: lmp
### Title: Fitting and testing linear models with permutation tests.
### Aliases: lmp
### Keywords: htest

### ** Examples

# 3x3 factorial with ordered factors, each is average of 12. 
# This is a saturated design with no df for error. The results tend to support 
# Cochran and Cox who used a guessed residual SS for their analysis. The design
# is balanced, so the sequential SS are the same as the unique SS. 
data(CC164)
summary(lmp(y ~ N * P, data = CC164, perm="")) # F-value output as if lm() was used.
summary(lmp(y ~ N * P, data = CC164,)) # Default, using "Exact" if possible.
summary(lmp(y ~ N * P, data = CC164, perm="SPR"))
anova(lmp(y ~ N * P, data = CC164))

# A two level factorial. The artificial data is N(0,1) with an effect of
# 1.5 added to factor X4. When the number of iterations are small, as in
# this case, using nCycle=1 is advantageous. 
X<-expand.grid(X1=1:2,X2=1:2,X3=1:2,X4=1:2)
X$Y<-c(0.99,1.34,0.88,1.94,0.63,0.29,-0.78,-0.89,0.43,-0.03,0.50,1.66,1.65,1.78,1.31,1.51)
summary(lmp(Y~(X1+X2+X3+X4)^2,X,"SP"))  # The prob method is used because "SP" is not recognized.
summary(lmp(Y~(X1+X2+X3+X4)^2,X,"SPR"))
summary(lmp(Y~(X1+X2+X3+X4)^2,X,"SPR",nCycle=1)) #An additional parameter being passed.

# A saturated design with 15 variables in 16 runs. The orginal analysis by Quinlan pooled the mean
# squares from the 7 smallest effcts and found many variables to be significant. Box, reanalyzed
# the data using half-normal plots and found only variables E and G to be important. The permutation
# analysis agrees with this conclusion.
data(Quinlan)
summary(lmp(SN~.,Quinlan))

# A design containing both a polynomial variable and a factor
data(simDesignPartNumeric)
anova(lmp(poly.formula(Y~quad(A,B)+C),simDesignPartNumeric))





