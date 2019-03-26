library(gsw)


### Name: gsw_beta
### Title: Haline contraction coefficient at constant Conservative
###   Temperature
### Aliases: gsw_beta

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
beta <- gsw_beta(SA,CT,p)
expect_equal(beta, 1e-3*c(0.717521909550091, 0.717657376442386, 0.726169785748549,
                          0.750420924314564, 0.754903052075032, 0.756841573481865))



