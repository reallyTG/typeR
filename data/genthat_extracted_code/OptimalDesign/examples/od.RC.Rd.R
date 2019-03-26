library(OptimalDesign)


### Name: od.RC
### Title: Efficient exact design using the RC heuristic
### Aliases: od.RC

### ** Examples

## No test: 
# Consider the spring balance weighing model with 6 items of unknown 
# weight. Suppose that we have already performed one weighing of each 
# item separately. We will compute an A-efficient augmentation designs 
# with 20 additional weighings. Then we will compute A-efficient designs 
# under the additional restriction that no item can be used more 
# than 8 times.

# Create the matrix of regressors of the model and the design 
# to be augmented.
F.sbw <- F.cube(~x1 + x2 + x3 + x4 + x5 + x6 - 1, rep(0, 6), 
                rep(1, 6), rep(2, 6))
w0 <- rep(0, 64); w0[apply(F.sbw, 1, sum)==1] <- 1

# Compute an exact A-efficient augmentation design with 26 
# total weighings.
b.sbw <- 26; A.sbw <- matrix(1, nrow=1, ncol=64)
res <- od.RC(F.sbw, b.sbw, A.sbw, w0=w0, crit="A", tab=1:6, t.max = 30)

# There are many A-optimal designs for this problem, which is possible 
# to see by running the line above several times with a very small 
# non-zero kappa. Note that each of the A-optimal experiments uses each 
# item exactly 11 times. Suppose that we can use each item at 
# most 8 times.

# Create the constraints A.eight * w <= b.eight representing 
# the restriction that no item can be used more than eight times 
# in the entire experiment.
b.eight <- rep(8, 6); A.eight <- t(F.sbw)

# Compute an exact A-efficient design with 26 total weighings under 
# all constraints defined above.
b.sbw <- c(b.eight, 26); A.sbw <- rbind(A.eight, rep(1,64))
res <- od.RC(F.sbw, b.sbw, A.sbw, w0=w0, crit="A", tab=1:6, t.max = 60)

# To find a lower bound on the true efficiency of the resulting design, 
# let us compare it to the A-optimal approximate design.
res.approx <- od.SOCP(F.sbw, b.sbw, A.sbw, w0=w0, crit="A", 
                      tab=1:6, t.max = 20)
res$Phi.best / res.approx$Phi.best
## End(No test)



