library(L0Learn)


### Name: coef.L0Learn
### Title: Extract Solutions
### Aliases: coef.L0Learn coef.L0LearnCV

### ** Examples

# Generate synthetic data for this example
data <- GenSynthetic(n=500,p=1000,k=10,seed=1)
X = data$X
y = data$y

# Fit an L0L2 Model with 10 values of Gamma ranging from 0.0001 to 10, using coordinate descent
fit <- L0Learn.fit(X, y, penalty="L0L2", maxSuppSize=50, nGamma=10, gammaMin=0.0001, gammaMax = 10)
print(fit)
# Extract the coefficients of the solution at lambda = 0.0361829 and gamma = 0.0001
coef(fit, lambda=0.0361829, gamma=0.0001)
# Extract the coefficients of all the solutions in the path
coef(fit)




