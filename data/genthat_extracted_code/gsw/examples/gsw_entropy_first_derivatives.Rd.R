library(gsw)


### Name: gsw_entropy_first_derivatives
### Title: First Derivatives of Entropy
### Aliases: gsw_entropy_first_derivatives

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
d <- gsw_entropy_first_derivatives(SA, CT)
expect_equal(d$eta_SA, c(-0.263286800711655, -0.263977276574528, -0.255367497912925,
                       -0.238066586439561, -0.234438260606436, -0.232820684341694))
expect_equal(d$eta_CT, c(13.221031210083824, 13.236911191313675, 13.489004628681361,
                       14.086599016583795, 14.257729576432077, 14.386429945649411))



