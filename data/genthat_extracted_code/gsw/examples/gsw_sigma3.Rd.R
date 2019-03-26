library(gsw)


### Name: gsw_sigma3
### Title: Potential density anomaly referenced to 3000 dbar
### Aliases: gsw_sigma3

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
sigma3 <- gsw_sigma3(SA,CT)
expect_equal(sigma3, c(34.003747849903675, 34.267409891564057, 36.316415829697917,
                       39.732367693977039, 40.397934186745033, 40.881795690566832))



