library(gsw)


### Name: gsw_entropy_ice
### Title: Entropy of ice
### Aliases: gsw_entropy_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,      600,      1000)
e <- gsw_entropy_ice(t, p)
expect_equal(e/1e3, c(-1.303663820598987, -1.324090218294577, -1.319426394193644,
                    -1.315402956671801, -1.305426590579231, -1.287021035328113))



