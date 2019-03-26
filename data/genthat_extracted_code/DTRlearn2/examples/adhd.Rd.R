library(DTRlearn2)


### Name: adhd
### Title: A 2-stage SMART data of children with ADHD
### Aliases: adhd
### Keywords: datasets

### ** Examples

library(DTRlearn2)
data(adhd)
attach(adhd)

n = length(a1)
H1 = scale(cbind(o11, o12, o13, o14))
H2 = scale(cbind(H1, a1, H1*a1, r, o22, r*a1, o22*a1))
colnames(H2)[12] = "r*a1"
colnames(H2)[13] = "o22*a1"

fit_ql = ql(H=list(H1, H2), AA=list(a1,a2), RR=list(rep(0, n), y),K=2,
            pi=list(rep(0.5, n), rep(0.5,n)), lasso=TRUE, m=3)

c = 2^c(-5:5)
fit_owl = owl(H=list(H1, H2), AA=list(a1,a2), RR=list(rep(0, n), y),
              n=n, K=2, pi=list(rep(0.5, n), rep(0.5,n)), res.lasso = TRUE,
              loss="hinge", kernel="linear", augment=TRUE, c=c, m=3)



