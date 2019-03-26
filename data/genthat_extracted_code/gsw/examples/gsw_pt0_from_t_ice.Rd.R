library(gsw)


### Name: gsw_pt0_from_t_ice
### Title: Potential Temperature of Ice Referenced to the Surface
### Aliases: gsw_pt0_from_t_ice

### ** Examples

t  <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <- c(       10,       50,      125,      250,      600,    1000)
pt0 <- gsw_pt0_from_t_ice(t, p)
expect_equal(pt0, c(-10.787787898205298, -13.443730926050607, -12.837427056999708,
                  -12.314321615760905, -11.017040858094250, -8.622907355083088))



