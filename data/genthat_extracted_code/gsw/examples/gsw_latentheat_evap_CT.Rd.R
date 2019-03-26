library(gsw)


### Name: gsw_latentheat_evap_CT
### Title: Latent heat of evaporation
### Aliases: gsw_latentheat_evap_CT

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
lh  <- gsw_latentheat_evap_CT(SA, CT)
expect_equal(lh/1e6, c(2.429947107462561, 2.430774073049213, 2.444220372158452,
                     2.474127109232524, 2.482151446148560, 2.488052297193594))



