library(SEL)


### Name: getbinPost
### Title: Calculate posterior distribution for binomial model
### Aliases: getbinPost
### Keywords: misc

### ** Examples

## Diaconis, Ylvisaker spun coin example (see references)
## simulate elicitations
x <- seq(0, 1, length=9)[2:8]
ymu <- 0.5*pbeta(x, 10, 20)+0.5*pbeta(x, 20, 10)
sig <- 0.05
set.seed(4)
y <- ymu+rnorm(7, 0, sqrt(ymu*(1-ymu))*sig)

## perform fitting with different selections
A <- SEL(x, y, d = 1, Delta = 0.001, inknts = x)
foo1 <- function(x) dbeta(x, 0.5, 0.5)
B <- SEL(x, y, d = 19, N=0, Delta = 0.02, pistar = foo1)
C <- SEL(x, y, d = 19, N=0, Delta = 0.05, pistar = foo1)
comparePlot(A, B, C, addArgs = list(layout = c(3,1)))

## posterior
sq <- seq(0,1,length=201)
res1 <- getbinPost(sq, A, 3, 10, type = "density")
res2 <- getbinPost(sq, B, 3, 10, type = "density")
res3 <- getbinPost(sq, C, 3, 10, type = "density")

## parametric posterior (corresponding to B(0.5,0.5) prior)
plot(sq, dbeta(sq, 3.5, 7.5), type="l", xlab = "",
     ylab = "Posterior density", lty = 4,
     ylim=c(0,max(c(res1, res2, res3))))
## "semiparametric" posteriors
lines(sq, res1, lty = 1)
lines(sq, res2, lty = 2)
lines(sq, res3, lty = 3)
legend(0.65,4, legend=c("Scenario A", "Scenario B", "Scenario C",
       "B(0.5,0.5) prior"), lty = 1:4)



