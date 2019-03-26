library(hitandrun)


### Name: sab
### Title: "Shake and Bake" sampler
### Aliases: sab
### Keywords: shake-and-bake uniform sampling

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

# take a point x0 within the polytope
x0 <- c(0.25, 0.25)

# sample 10,000 points
result <- sab(x0, 1, constr, 1E4)
samples <- result$samples

# Check dimension of result
stopifnot(dim(samples) == c(1E4, 2))

# Check that x_i >= 0
stopifnot(samples >= -1E-15)

# Check that x_1 + x_2 <= 1
stopifnot(samples[,1] + samples[,2] <= 1 + 1E-15)

# check that the results lie on the faces
faces <- result$faces
stopifnot(all.equal(samples[faces==1,1], rep(0, sum(faces==1))))
stopifnot(all.equal(samples[faces==2,2], rep(0, sum(faces==2))))
stopifnot(all.equal(samples[faces==3,1] + samples[faces==3,2], rep(1, sum(faces==3))))

## Not run: plot(samples)




