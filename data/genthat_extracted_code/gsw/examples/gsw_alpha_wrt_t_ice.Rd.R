library(gsw)


### Name: gsw_alpha_wrt_t_ice
### Title: Ice Thermal Expansion Coefficient with Respect to in-situ
###   Temperature
### Aliases: gsw_alpha_wrt_t_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,       50,      125,      250,      600,    1000)
alpha <- gsw_alpha_wrt_t_ice(t, p)
expect_equal(alpha*1e3, c(0.154472408751279, 0.153041866100900, 0.153232698269327,
                        0.153297634665747, 0.153387461617896, 0.153938395452558))



