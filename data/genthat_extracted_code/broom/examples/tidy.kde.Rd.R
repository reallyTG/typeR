library(broom)


### Name: tidy.kde
### Title: Tidy a(n) kde object
### Aliases: tidy.kde kde_tidiers ks_tidiers

### ** Examples


if (requireNamespace("ks", quietly = TRUE)) {
  
  library(ks)
  
  dat <- replicate(2, rnorm(100))
  k <- kde(dat)

  td <- tidy(k)
  td

  library(ggplot2)
  ggplot(td, aes(x1, x2, fill = estimate)) +
    geom_tile() +
    theme_void()

  # also works with 3 dimensions
  dat3 <- replicate(3, rnorm(100))
  k3 <- kde(dat3)

  td3 <- tidy(k3)
  td3
}




