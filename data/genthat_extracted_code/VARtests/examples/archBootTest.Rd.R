library(VARtests)


### Name: archBootTest
### Title: Combined LM test for ARCH errors in VAR models.
### Aliases: archBootTest print.archBootTest

### ** Examples


fit <- VARfit(y = VodafoneCDS, p = 3, const = TRUE, trend = FALSE)
test <- archBootTest(fit = fit, h = 5, B = 199, CA = TRUE, ET = TRUE, MARCH = TRUE, dist = "norm")




