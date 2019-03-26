library(gsw)


### Name: gsw_melting_ice_equilibrium_SA_CT_ratio_poly
### Title: Calculate d(SA)/d(CT) for Ice Melting in near-freezing Seawater
###   (Polynomial version)
### Aliases: gsw_melting_ice_equilibrium_SA_CT_ratio_poly

### ** Examples

SA <- c(   34.7118,  34.8915,  35.0256,  34.8472,  34.7366, 34.7324)
p <- c(         10,       50,      125,      250,      600,    1000)
r <- gsw_melting_ice_equilibrium_SA_CT_ratio_poly(SA, p)
expect_equal(r, c(0.420209444587263, 0.422511664682796, 0.424345538275708,
                0.422475965003649, 0.422023755182266, 0.423038080717229))



