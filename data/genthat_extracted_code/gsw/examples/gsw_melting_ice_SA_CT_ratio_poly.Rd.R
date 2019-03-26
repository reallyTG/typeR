library(gsw)


### Name: gsw_melting_ice_SA_CT_ratio_poly
### Title: Calculate d(SA)/d(CT) for Ice Melting in Seawater (Polynomial
###   version)
### Aliases: gsw_melting_ice_SA_CT_ratio_poly

### ** Examples

SA <- c(   34.7118,  34.8915,  35.0256,  34.8472,  34.7366, 34.7324)
CT <- c(    3.7856,   3.4329,   2.8103,   1.2600,   0.6886,  0.4403)
p <- c(         10,       50,      125,      250,      600,    1000)
t_Ih <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
r <- gsw_melting_ice_SA_CT_ratio_poly(SA, CT, p, t_Ih)
expect_equal(r, c(0.373840908629278, 0.371878512745054, 0.377104658031030,
                0.382777681212224, 0.387133812279563, 0.393947267481204))



