library(NORMA)


### Name: ILF_cost_der
### Title: Cost Functions Derivatives
### Aliases: ILF_cost_der beta_cost_der general_gaussian_cost_der
###   general_laplace_cost_der moge_cost_der weibull_cost_der
###   zero_gaussian_cost_der zero_laplace_cost_der

### ** Examples

# ILF derivative value at point phi=1 with default epsilon.
ILF_cost_der(1)

# ILF derivative value at point phi=1 with epsilon=2.
ILF_cost_der(1,2)

# Zero-mean Laplace loss function derivative value at point phi=1 with sigma=1.
zero_laplace_cost_der(1,1)

# General Laplace loss function derivative value at point phi=1 with mu=0 and sigma=1.
general_laplace_cost_der(1,1,0)

# Zero-mean Gaussian loss function derivative value at point phi=1 with sigma_cuad=1.
zero_gaussian_cost_der(1,1)

# General Gaussian loss function derivative value at point phi=1 with mu=0 and sigma_cuad=1.
general_gaussian_cost_der(1,1,0)

# Beta loss function derivative value at point phi=1 with alpha=2 and beta=3.
beta_cost_der(1,2,3)

# Weibull loss function derivative value at point phi=1 with lambda=2 and kappa=3.
weibull_cost_der(1,2,3)

# MOGE loss function derivative value at point phi=1 with lambda=2 ,alpha=3 and theta=4.
moge_cost_der(1,2,3,4)



