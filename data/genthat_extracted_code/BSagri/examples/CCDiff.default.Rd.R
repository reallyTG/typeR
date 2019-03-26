library(BSagri)


### Name: CCDiff.default
### Title: Compute contrasts of chains of joint empirical distributions.
### Aliases: CCDiff.default
### Keywords: internal

### ** Examples


# What the function does:

# a 10 times 4 matrix

X<-round(cbind(
 rnorm(10,1,1),
 rnorm(10,1,1),
 rnorm(10,1,1),
 rnorm(10,1,1)))

# and a x times 4 contrast matrix

CMAT<-rbind(
c(-1,1,0,0),
c(-1,0,1,0),
c(-1,0,0,1)
)

CCDiff.default(x=X, cmat=CMAT)




