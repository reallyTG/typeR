library(gsw)


### Name: gsw_pt_from_CT
### Title: Potential temperature from Conservative Temperature
### Aliases: gsw_pt_from_CT

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
pt <- gsw_pt_from_CT(SA, CT)
expect_equal(pt, c(28.783177048624573, 28.420955597191984, 22.784953468087107,
                   10.230534394434429, 6.829216587061605, 4.324534835990236))



