library(gsw)


### Name: gsw_alpha_on_beta
### Title: Thermal expansion coefficient over haline contraction
###   coefficient
### Aliases: gsw_alpha_on_beta

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <-  c(     10,      50,     125,     250,     600,    1000)
alpha_on_beta <- gsw_alpha_on_beta(SA,CT,p)
expect_equal(alpha_on_beta, c(0.452468543022009, 0.449601695030057, 0.387140203094424,
                              0.230778871228268, 0.193747796234162, 0.170946048860385))



