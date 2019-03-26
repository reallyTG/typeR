library(KraljicMatrix)


### Name: MAVF_sensitivity
### Title: Multi-attribute value function sensitivity analysis
### Aliases: MAVF_sensitivity

### ** Examples


# Given the following data frame that contains \code{x} and \code{y} attribute
# values for each product or service contract, we can compute how the range of
# swing weights for each \code{x} and \code{y} attribute influences the multi-
# attribute value score.

df <- data.frame(contract = 1:10,
                 x_attribute = c(0.92, 0.79, 1.00, 0.39, 0.68, 0.55, 0.73, 0.76, 1.00, 0.74),
                 y_attribute = c(0.52, 0.19, 0.62, 1.00, 0.55, 0.52, 0.53, 0.46, 0.61, 0.84))

MAVF_sensitivity(df, x_attribute, y_attribute, .55, .75, .25, .45)




