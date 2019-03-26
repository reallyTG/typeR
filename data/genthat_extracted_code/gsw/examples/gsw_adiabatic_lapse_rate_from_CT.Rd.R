library(gsw)


### Name: gsw_adiabatic_lapse_rate_from_CT
### Title: Adiabatic Lapse Rate
### Aliases: gsw_adiabatic_lapse_rate_from_CT

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
lr <- gsw_adiabatic_lapse_rate_from_CT(SA, CT, p)
expect_equal(lr*1e7, c(0.240199646230069, 0.238457486976761, 0.203635157319712,
                     0.119829566859790, 0.100052760967308, 0.087773070307283))



