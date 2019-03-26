library(hitandrun)


### Name: hitandrun
### Title: "Hit and Run" sampler
### Aliases: hitandrun har.init har.run
### Keywords: hit-and-run uniform sampling

### ** Examples

# Sample from the 3-simplex with the additional constraint that w_1/w_2 = 2
# Three inequality constraints, two equality constraints
constr <- mergeConstraints(simplexConstraints(3), exactRatioConstraint(3, 1, 2, 2))
samples <- hitandrun(constr, n.samples=1000)
stopifnot(dim(samples) == c(1000, 3))
stopifnot(all.equal(apply(samples, 1, sum), rep(1, 1000)))
stopifnot(all.equal(samples[,1]/samples[,2], rep(2, 1000)))

# Sample from the unit rectangle (no equality constraints)
constr <- list(
  constr = rbind(c(1,0), c(0,1), c(-1,0), c(0,-1)),
  dir=rep('<=', 4),
  rhs=c(1, 1, 0, 0))
state <- har.init(constr)
result <- har.run(state, n.samples=1000)
samples <- result$samples
stopifnot(all(samples >= 0 & samples <= 1))
# Continue sampling from the same chain:
result <- har.run(result$state, n.samples=1000)
samples <- rbind(samples, result$samples)



