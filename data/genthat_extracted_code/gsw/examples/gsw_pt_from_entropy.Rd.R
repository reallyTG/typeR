library(gsw)


### Name: gsw_pt_from_entropy
### Title: Potential Temperature from Entropy
### Aliases: gsw_pt_from_entropy

### ** Examples

SA <- c(      34.7118,  34.8915,  35.0256,  34.8472, 34.7366, 34.7324)
entropy <- c(400.3892, 395.4378, 319.8668, 146.7910, 98.6471, 62.7919)
pt <- gsw_pt_from_entropy(SA, entropy)
expect_equal(pt, c(28.783179828078666, 28.420954825949291, 22.784952736245351,
                 10.230532066931868, 6.829213325916900, 4.324537782985845))



