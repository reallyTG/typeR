library(gsw)


### Name: gsw_enthalpy_ice
### Title: Ice Specific Enthalpy
### Aliases: gsw_enthalpy_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
se <- gsw_enthalpy_ice(t, p)
expect_equal(se/1e5, c(-3.554414597446597, -3.603380857687490, -3.583089884253586,
                     -3.558998379233944, -3.494811024956881, -3.402784319238127))



