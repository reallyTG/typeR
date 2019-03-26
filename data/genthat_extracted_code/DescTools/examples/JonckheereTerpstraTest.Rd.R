library(DescTools)


### Name: JonckheereTerpstraTest
### Title: Exact Version of Jonckheere-Terpstra Test
### Aliases: JonckheereTerpstraTest JonckheereTerpstraTest.default
###   JonckheereTerpstraTest.formula
### Keywords: htest

### ** Examples

set.seed(1234)
g <- ordered(rep(1:5, rep(10,5)))
x <- rnorm(50) + 0.3 * as.numeric(g)

JonckheereTerpstraTest(x, g)

x[1:2] <- mean(x[1:2]) # tied data

JonckheereTerpstraTest(x, g)
JonckheereTerpstraTest(x, g, nperm=5000)

# Duller, S. 222
coffee <- data.frame(
  time=c(
  447,396,383,410,
  438,521,468,391,504,472,
  513,543,506,489,407), 
  grp=Untable(c(4,6,5), type="ordered")[,1]
)  

# the formula interface:
JonckheereTerpstraTest(time ~ grp, data=coffee)



