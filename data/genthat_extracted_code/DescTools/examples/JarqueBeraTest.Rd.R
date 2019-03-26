library(DescTools)


### Name: JarqueBeraTest
### Title: (Robust) Jarque Bera Test
### Aliases: JarqueBeraTest
### Keywords: htest

### ** Examples

x <- rnorm(100)    # null hypothesis
JarqueBeraTest(x)

x <- runif(100)    # alternative hypothesis
JarqueBeraTest(x, robust=TRUE)



