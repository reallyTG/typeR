library(qqtest)


### Name: rkay
### Title: 'rkay' The K distribution - generating pseudo-random values
### Aliases: rkay

### ** Examples


x <- rkay(100, 20)
hist(x, main="100 observations from a K(20)")
# Certainly looks like it comes from a K on 20
qqtest(x, dist="kay",df=20)
# for this many degrees of freedom it looks  
# a lot like a gaussian (normal) distribution
qqtest(x, dist="gau",df=1)
# But not like it came from a K on 1 degree of freedom
qqtest(x, dist="kay",df=1)
#



