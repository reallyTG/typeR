library(hitandrun)


### Name: shakeandbake
### Title: "Shake and Bake" sampler
### Aliases: shakeandbake sab.init sab.run
### Keywords: shake-and-bake uniform sampling

### ** Examples

# Sample from the 3-simplex with the additional constraint that w_1/w_2 = 2
# Three inequality constraints, two equality constraints
constr <- mergeConstraints(simplexConstraints(3), exactRatioConstraint(3, 1, 2, 2))
samples <- shakeandbake(constr, n.samples=1000)
stopifnot(dim(samples) == c(1000, 3))
stopifnot(all.equal(apply(samples, 1, sum), rep(1, 1000)))

sel <- samples[,3] > 0.5 # detect which side we're on
stopifnot(all.equal(samples[sel,], matrix(rep(c(0,0,1), each=sum(sel)), ncol=3)))
stopifnot(all.equal(samples[!sel,], matrix(rep(c(2/3,1/3,0), each=sum(sel)), ncol=3)))

# Sample from the unit rectangle (no equality constraints)
constr <- list(
  constr = rbind(c(1,0), c(0,1), c(-1,0), c(0,-1)),
  dir=rep('<=', 4),
  rhs=c(1, 1, 0, 0))
state <- sab.init(constr)
result <- sab.run(state, n.samples=1000)
faces <- result$faces
samples <- result$samples
stopifnot(all(samples >= -1e-15 & samples <= 1 + 1e-15))

stopifnot(all.equal(samples[faces==1,1], rep(1, sum(faces==1))))
stopifnot(all.equal(samples[faces==2,2], rep(1, sum(faces==2))))
stopifnot(all.equal(samples[faces==3,1], rep(0, sum(faces==3))))
stopifnot(all.equal(samples[faces==4,2], rep(0, sum(faces==4))))

# Continue sampling from the same chain:
result <- sab.run(result$state, n.samples=1000)
samples <- rbind(samples, result$samples)



