library(gsw)


### Name: gsw_SA_freezing_from_CT_poly
### Title: Compute Absolute Salinity at Freezing Point (Polynomial version)
### Aliases: gsw_SA_freezing_from_CT_poly

### ** Examples

CT <- c(-0.11901, -0.15608, -0.72138, -1.97738, -2.31728, -2.56764)
p <- c(       10,       50,      125,      250,      600,     1000)
saturation_fraction <- 1
SA <- gsw_SA_freezing_from_CT_poly(CT, p, saturation_fraction)
expect_equal(SA, c(2.281810267792954, 2.418134292641376, 11.971996354752958,
                 32.867931280363138, 34.015087798162732, 32.856434894818825))



