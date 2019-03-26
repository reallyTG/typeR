library(broom)


### Name: tidy.manova
### Title: Tidy a(n) manova object
### Aliases: tidy.manova

### ** Examples


npk2 <- within(npk, foo <- rnorm(24))
m <- manova(cbind(yield, foo) ~ block + N * P * K, npk2)
tidy(m) 




