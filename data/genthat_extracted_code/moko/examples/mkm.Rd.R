library(moko)


### Name: mkm
### Title: Multi-objective Kriging model
### Aliases: mkm

### ** Examples

# ------------------------
# The Nowacki Beam
# ------------------------
n <- 10
d <- 2
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, nowacki_beam))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2))



