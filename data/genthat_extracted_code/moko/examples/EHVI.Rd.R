library(moko)


### Name: EHVI
### Title: EHVI: Constrained Expected Hypervolume Improvement
### Aliases: EHVI

### ** Examples

# ------------------------
# The Nowacki Beam
# ------------------------
n <- 20
d <- 2
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, nowacki_beam, box = data.frame(b = c(10, 50), h = c(50, 250))))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower=rep(0.1,d)))
grid <- expand.grid(seq(0, 1, , 20),seq(0, 1, , 20))
ehvi <- apply(grid, 1, EHVI, model)
contour(matrix(ehvi, 20))
points(model@design, col=ifelse(model@feasible,'blue','red'))
points(grid[which.max(ehvi),], col='green', pch=19)



