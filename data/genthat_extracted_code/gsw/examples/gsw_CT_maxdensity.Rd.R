library(gsw)


### Name: gsw_CT_maxdensity
### Title: Conservative Temperature at Maximum Density
### Aliases: gsw_CT_maxdensity

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <-  c(     10,      50,     125,     250,     600,    1000)
CT <- gsw_CT_maxdensity(SA, p)
expect_equal(CT, c(-3.731407240089855, -3.861137427731664, -4.060390602245942,
                 -4.306222571955388, -5.089240667106197, -6.028034316992341))



