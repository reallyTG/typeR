library(gsw)


### Name: gsw_CT_from_entropy
### Title: Conservative Temperature from Entropy
### Aliases: gsw_CT_from_entropy

### ** Examples

SA <- c(      34.7118,  34.8915,  35.0256,  34.8472, 34.7366, 34.7324)
entropy <- c(400.3892, 395.4378, 319.8668, 146.7910, 98.6471, 62.7919)
CT <- gsw_CT_from_entropy(SA, entropy)
expect_equal(CT, c(28.809902787278070, 28.439199226786918, 22.786199266954270,
                 10.226197672488652, 6.827196739780282, 4.323602945446461))



