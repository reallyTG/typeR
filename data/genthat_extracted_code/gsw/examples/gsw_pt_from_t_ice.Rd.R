library(gsw)


### Name: gsw_pt_from_t_ice
### Title: Potential Temperature of Ice from in-situ Temperature
### Aliases: gsw_pt_from_t_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <- c(      10,       50,      125,      250,      600,    1000)
p_ref <- 0 # not actually needed, since 0 is the default
pt <- gsw_pt_from_t_ice(t, p, p_ref)
expect_equal(pt, c(-10.787787898205272, -13.443730926050661, -12.837427056999676,
                 -12.314321615760921, -11.017040858094234, -8.622907355083147))



