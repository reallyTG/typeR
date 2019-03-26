library(gsw)


### Name: gsw_latentheat_evap_t
### Title: Latent heat of evaporation
### Aliases: gsw_latentheat_evap_t

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
t <- c( 28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
lh = gsw_latentheat_evap_t(SA, t)
expect_equal(lh/1e6, c(2.429882982734836, 2.430730236218543, 2.444217294049004,
                     2.474137411322517, 2.482156276375029, 2.488054617630297))



