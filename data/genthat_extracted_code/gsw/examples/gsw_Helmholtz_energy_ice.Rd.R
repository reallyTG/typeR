library(gsw)


### Name: gsw_Helmholtz_energy_ice
### Title: Helmholtz Energy of Ice
### Aliases: gsw_Helmholtz_energy_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,       600,     1000)
e <- gsw_Helmholtz_energy_ice(t, p)
expect_equal(e/1e4, c(-1.362572315008330, -1.710375005915343, -1.628083272702224,
                    -1.555573047498573, -1.375469831393882, -1.053585607014677))



