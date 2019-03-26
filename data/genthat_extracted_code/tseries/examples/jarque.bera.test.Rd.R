library(tseries)


### Name: jarque.bera.test
### Title: Jarque-Bera Test
### Aliases: jarque.bera.test
### Keywords: ts

### ** Examples

x <- rnorm(100)  # null
jarque.bera.test(x)

x <- runif(100)  # alternative
jarque.bera.test(x)



