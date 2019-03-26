library(DescTools)


### Name: DurbinWatsonTest
### Title: Durbin-Watson Test
### Aliases: DurbinWatsonTest
### Keywords: htest

### ** Examples


## generate two AR(1) error terms with parameter
## rho = 0 (white noise) and rho = 0.9 respectively
err1 <- rnorm(100)

## generate regressor and dependent variable
x <- rep(c(-1,1), 50)
y1 <- 1 + x + err1

## perform Durbin-Watson test
DurbinWatsonTest(y1 ~ x)

err2 <- filter(err1, 0.9, method="recursive")
y2 <- 1 + x + err2
DurbinWatsonTest(y2 ~ x)

## for a simple vector use:
e_t <- c(-32.33, -26.603, 2.215, -16.967, -1.148, -2.512, -1.967, 11.669,
         -0.513, 27.032, -4.422, 40.032, 23.577, 33.94, -2.787, -8.606,
          0.575, 6.848, -18.971, -29.063)
DurbinWatsonTest(e_t ~ 1)



