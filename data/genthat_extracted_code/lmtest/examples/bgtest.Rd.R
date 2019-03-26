library(lmtest)


### Name: bgtest
### Title: Breusch-Godfrey Test
### Aliases: bgtest vcov.bgtest df.residual.bgtest
### Keywords: htest

### ** Examples


     ## Generate a stationary and an AR(1) series
     x <- rep(c(1, -1), 50)

     y1 <- 1 + x + rnorm(100)

     ## Perform Breusch-Godfrey test for first-order serial correlation:
     bgtest(y1 ~ x)
     ## or for fourth-order serial correlation
     bgtest(y1 ~ x, order = 4)
     ## Compare with Durbin-Watson test results:
     dwtest(y1 ~ x)

     y2 <- filter(y1, 0.5, method = "recursive")
     bgtest(y2 ~ x)
     bg4 <- bgtest(y2 ~ x, order = 4)
     bg4
     coeftest(bg4)



