library(gsw)


### Name: gsw_CT_first_derivatives
### Title: First Derivatives of Conservative Temperature
### Aliases: gsw_CT_first_derivatives

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
pt <- c(28.7832, 28.4209, 22.7850, 10.2305,  6.8292,  4.3245)
r <- gsw_CT_first_derivatives(SA, pt)
expect_equal(r$CT_SA, c(-0.041981092877806, -0.041558140199508, -0.034739209004865,
                      -0.018711103772892, -0.014075941811725, -0.010571716552295))
expect_equal(r$CT_pt, c(1.002814937296636, 1.002554817053239, 1.001645140295163,
                      1.000003771100520, 0.999716359504731, 0.999474326580093))



