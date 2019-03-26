library(KraljicMatrix)


### Name: MAVF_score
### Title: Multi-attribute value function
### Aliases: MAVF_score

### ** Examples


# Given the following \code{x} and \code{y} attribute values with \code{x} and
# \code{y} swing weight values of 0.65 and 0.35 respectively, we can compute
# the multi-attribute utility score:

x_attribute <- c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74)
y_attribute <- c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84)

MAVF_score(x_attribute, y_attribute, x_wt = .65, y_wt = .35)





