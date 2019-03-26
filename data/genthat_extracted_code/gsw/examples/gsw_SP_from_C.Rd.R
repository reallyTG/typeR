library(gsw)


### Name: gsw_SP_from_C
### Title: Convert from Electrical Conductivity to Practical Salinity
### Aliases: gsw_SP_from_C

### ** Examples

C <- c(34.5487, 34.7275, 34.8605, 34.6810, 34.5680, 34.5600)
t <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(     10,      50,     125,     250,     600,    1000)
SP <- gsw_SP_from_C(C,t,p)
expect_equal(SP,  c(20.009869599086951, 20.265511864874270, 22.981513062527689,
                    31.204503263727982, 34.032315787432829, 36.400308494388170))



