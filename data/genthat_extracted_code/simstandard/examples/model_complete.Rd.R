library(simstandard)


### Name: model_complete
### Title: Function that takes a lavaan model with standardized paths and
###   loadings and returns a complete lavaan model syntax with standardized
###   variances
### Aliases: model_complete

### ** Examples

library(simstandard)
# lavaan model
m = "
Latent_1 =~ 0.9 * Ob_11 + 0.8 * Ob_12 + 0.7 * Ob_13
Latent_2 =~ 0.9 * Ob_21 + 0.6 * Ob_22 + 0.4 * Ob_23
Latent_2 ~ 0.6 * Latent_1
"
# Same lavaan syntax, but with standardized variances
m_complete <- model_complete(m)
cat(m_complete)



