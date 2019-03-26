library(vcdExtra)


### Name: zero.test
### Title: Score test for zero inflation in Poisson data
### Aliases: zero.test
### Keywords: htest

### ** Examples

# synthetic tests
zero.test(rpois(100, 1))
zero.test(rpois(100, 5))
# add some extra zeros
zero.test(c(rep(0, 20), rpois(100, 5)))

# Articles by Phd candidates
data(PhdPubs, package="vcdExtra")
zero.test(PhdPubs$articles)

phd.tab <- table(PhdPubs$articles)
zero.test(phd.tab)




