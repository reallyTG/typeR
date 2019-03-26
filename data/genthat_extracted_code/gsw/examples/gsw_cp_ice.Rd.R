library(gsw)


### Name: gsw_cp_ice
### Title: Specific heat to ice
### Aliases: gsw_cp_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
cp <- gsw_cp_ice(t, p)
expect_equal(cp, c(2017.314262094657, 1997.830122682709, 2002.281331375396,
                 2006.127319545421, 2015.676303959609, 2033.308170371559))



