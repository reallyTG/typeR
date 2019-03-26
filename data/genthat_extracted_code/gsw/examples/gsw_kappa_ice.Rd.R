library(gsw)


### Name: gsw_kappa_ice
### Title: Isentropic Compressibility of Ice
### Aliases: gsw_kappa_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,       600,     1000)
kappa <- gsw_kappa_ice(t, p)
expect_equal(kappa*1e9, c(0.112495239053936, 0.112070687842183, 0.112119091047584,
                        0.112126504739297, 0.112123513812840, 0.112262589530974))



