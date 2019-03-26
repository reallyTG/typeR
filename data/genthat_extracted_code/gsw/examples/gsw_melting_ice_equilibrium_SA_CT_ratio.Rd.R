library(gsw)


### Name: gsw_melting_ice_equilibrium_SA_CT_ratio
### Title: Calculate d(SA)/d(CT) for Ice Melting in near-freezing Seawater
### Aliases: gsw_melting_ice_equilibrium_SA_CT_ratio

### ** Examples

SA <- c(   34.7118,  34.8915,  35.0256,  34.8472,  34.7366, 34.7324)
p <- c(         10,       50,      125,      250,      600,    1000)
r <- gsw_melting_ice_equilibrium_SA_CT_ratio(SA, p)
expect_equal(r, c(0.420209509196985, 0.422511693121631, 0.424345503216433,
                0.422475836091426, 0.422023427778221, 0.423037622331042))



