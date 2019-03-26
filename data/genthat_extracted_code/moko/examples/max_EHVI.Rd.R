library(moko)


### Name: max_EHVI
### Title: max_EHVI: Maximization of the Expected Hypervolume Improvement
###   criterion
### Aliases: max_EHVI

### ** Examples

# ------------------------
# The Nowacki Beam
# ------------------------
n <- 20
d <- 2
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, nowacki_beam, box = data.frame(b = c(10, 50), h = c(50, 250))))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower=c(0.1,0.1)))
max_EHVI(model)



