library(moko)


### Name: predict_front
### Title: Predicted Pareto front
### Aliases: predict_front

### ** Examples

# ------------------------
# The Nowacki Beam
# ------------------------
n <- 100
doe <- cbind(sample(0:n,n),sample(0:n,n))/n
res <- t(apply(doe, 1, nowacki_beam))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower=c(0.1,0.1)))
pf <- predict_front(model, c(0,0), c(1,1))
plot(nowacki_beam_tps$set)
points(pf$set, col='blue')



