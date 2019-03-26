library(oce)


### Name: swCSTp
### Title: Electrical conductivity ratio from salinity, temperature and
###   pressure
### Aliases: swCSTp

### ** Examples

expect_equal(1, swCSTp(35, T90fromT68(15), 0, eos="unesco")) # by definition of cond. ratio
expect_equal(1, swCSTp(34.25045, T90fromT68(15), 2000, eos="unesco"), tolerance=1e-7)
expect_equal(1, swCSTp(34.25045, T90fromT68(15), 2000, eos="gsw"), tolerance=1e-7)




