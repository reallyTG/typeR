library(simstandard)


### Name: fixed2free
### Title: Remove fixed parameters from a lavaan model
### Aliases: fixed2free

### ** Examples

library(simstandard)
# lavaan model with fixed parameters
m = "
Latent_1 =~ 0.9 * Ob_11 + 0.8 * Ob_12 + 0.7 * Ob_13
Latent_2 =~ 0.9 * Ob_21 + 0.6 * Ob_22 + 0.4 * Ob_23
"
# Same model, but with fixed parameters removed.
m_free <- fixed2free(m)
cat(m_free)



