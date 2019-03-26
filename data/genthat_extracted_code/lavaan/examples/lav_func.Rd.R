library(lavaan)


### Name: lav_func
### Title: Utility Functions: Gradient and Jacobian
### Aliases: lav_func_gradient_complex lav_func_gradient_simple
###   lav_func_jacobian_complex lav_func_jacobian_simple

### ** Examples

# very accurate complex method
lav_func_gradient_complex(func = exp, x = 1) - exp(1)

# less accurate forward method
lav_func_gradient_simple(func = exp, x = 1) - exp(1)

# very accurate complex method
diag(lav_func_jacobian_complex(func = exp, x = c(1,2,3))) - exp(c(1,2,3))

# less accurate forward method
diag(lav_func_jacobian_simple(func = exp, x = c(1,2,3))) - exp(c(1,2,3))



