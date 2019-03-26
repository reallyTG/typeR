library(gsw)


### Name: gsw_kappa_const_t_ice
### Title: Isothermal Compressibility of Ice
### Aliases: gsw_kappa_const_t_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,       600,     1000)
kappa <- gsw_kappa_const_t_ice(t, p)
expect_equal(kappa*1e9, c(0.115874753261484, 0.115384948953145, 0.115442212717850,
                        0.115452884634531, 0.115454824232421, 0.115619994536961))



