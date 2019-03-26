library(gsw)


### Name: gsw_spiciness1
### Title: Seawater Spiciness at p=1000 dbar
### Aliases: gsw_spiciness1

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
spiciness <- gsw_spiciness1(SA, CT)
expect_equal(spiciness, c(6.311038322123224, 6.326411175472160, 4.667218659743284,
                          1.351722468726905, 0.628494082166029, 0.224779784908478))



