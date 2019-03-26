library(moko)


### Name: predict,mkm-method
### Title: Predictor for a multiobjective Kriging model
### Aliases: predict,mkm-method predict

### ** Examples

# ------------------------
# The Nowacki Beam
# ------------------------
n <- 100
d <- 2
N <- 50
doe <- replicate(d,sample(0:n,n))/n
res <- t(apply(doe, 1, nowacki_beam))
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower = rep(0.01, d)))
newx <- expand.grid(replicate(d,seq(0,1,,N),FALSE))
pred <- predict(model, newx)
realv <- t(apply(newx, 1, nowacki_beam))
par(mfrow=c(2,3), mar=c(2,2,1,1))
for (i in 1:6){
  contour(matrix((realv[,i]),N), col='red', lty=2, labels='')
  contour(matrix((pred$mean[,i]),N), add = TRUE)
}



