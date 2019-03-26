library(DescTools)


### Name: BreuschGodfreyTest
### Title: Breusch-Godfrey Test
### Aliases: BreuschGodfreyTest
### Keywords: htest

### ** Examples

## Generate a stationary and an AR(1) series
x <- rep(c(1, -1), 50)

y1 <- 1 + x + rnorm(100)

## Perform Breusch-Godfrey test for first-order serial correlation:
BreuschGodfreyTest(y1 ~ x)

## or for fourth-order serial correlation
BreuschGodfreyTest(y1 ~ x, order = 4)

## Compare with Durbin-Watson test results:
DurbinWatsonTest(y1 ~ x)

y2 <- filter(y1, 0.5, method = "recursive")
BreuschGodfreyTest(y2 ~ x)



