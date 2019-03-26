library(gsw)


### Name: gsw_specvol_ice
### Title: Specific Volume of Ice
### Aliases: gsw_specvol_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,       600,     1000)
v <- gsw_specvol_ice(t, p)
expect_equal(v, c(0.001088982980677, 0.001088489459509, 0.001088499019939,
                0.001088433747301, 0.001088223220685, 0.001088135464776))



