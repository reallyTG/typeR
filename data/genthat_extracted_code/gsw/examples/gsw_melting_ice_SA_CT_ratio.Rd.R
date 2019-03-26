library(gsw)


### Name: gsw_melting_ice_SA_CT_ratio
### Title: Calculate d(SA)/d(CT) for Ice Melting in Seawater
### Aliases: gsw_melting_ice_SA_CT_ratio

### ** Examples

SA <- c(   34.7118,  34.8915,  35.0256,  34.8472,  34.7366, 34.7324)
CT <- c(    3.7856,   3.4329,   2.8103,   1.2600,   0.6886,  0.4403)
p <- c(         10,       50,      125,      250,      600,    1000)
t_Ih <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
r <- gsw_melting_ice_SA_CT_ratio(SA, CT, p, t_Ih)
expect_equal(r, c(0.373840909022490, 0.371878514972099, 0.377104664622191,
                0.382777696796156, 0.387133845152000, 0.393947316026914))



