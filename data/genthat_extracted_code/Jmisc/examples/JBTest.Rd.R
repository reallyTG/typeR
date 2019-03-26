library(Jmisc)


### Name: JBTest
### Title: p Value of Jarque Bera test
### Aliases: JBTest

### ** Examples

JBTest(rnorm(50))
JBTest(rt(50,3))

n=100
# size
mean(replicate(n,JBTest(rnorm(100)))<0.05)

# power
mean(replicate(n,JBTest(rt(100,3)))<0.05)



