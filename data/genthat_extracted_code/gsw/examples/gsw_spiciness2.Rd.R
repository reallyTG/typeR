library(gsw)


### Name: gsw_spiciness2
### Title: Seawater Spiciness at p=2000 dbar
### Aliases: gsw_spiciness2

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
spiciness <- gsw_spiciness2(SA, CT)
expect_equal(spiciness, c(6.874671751873180, 6.884616399155135, 5.154458892387083,
                          1.624327800598636, 0.823490797424952, 0.355069307641827))



