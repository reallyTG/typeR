library(gsw)


### Name: gsw_SA_freezing_from_CT
### Title: Compute Absolute Salinity at Freezing Conservative Temperature
### Aliases: gsw_SA_freezing_from_CT

### ** Examples

CT <- c(-0.11901, -0.15608, -0.72138, -1.97738, -2.31728, -2.56764)
p <- c(       10,       50,      125,      250,      600,     1000)
saturation_fraction <- 1
SA <- gsw_SA_freezing_from_CT(CT, p, saturation_fraction)
expect_equal(SA, c(2.280500648179144, 2.416867651098550, 11.973503162175106,
                 32.868973869711390, 34.017513292374431, 32.859871943514150))



