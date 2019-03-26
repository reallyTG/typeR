library(moko)


### Name: HEGO
### Title: HEGO: Efficient Global Optimization Algorithm based on the
###   Hypervolume criteria
### Aliases: HEGO

### ** Examples

# ----------------
# The Nowacki Beam
# ----------------
n <- 20
d <- 2
nsteps <- 1 # value has been set to 1 to save compliation time, change this value to 40.
fun <- nowacki_beam
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, fun))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower = rep(0.1,d)))
model <- HEGO(model, fun, nsteps, quiet = FALSE)
plot(nowacki_beam_tps$set)
points(ps(model@response[which(model@feasible),model@objective])$set, col = 'green', pch = 19)



