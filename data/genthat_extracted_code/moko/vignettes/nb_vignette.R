## ---- fig.width=4, fig.height=4, fig.align='center', echo=FALSE----------
library(moko)
true_ps <- nowacki_beam_tps
par(mar=c(3,2.5,0.5,0.5)+0.1, mgp = c(1.75, 0.5, 0))
plot(true_ps$set, pch=20, xlab = expression(paste("Area [mm"^"2"*"]")), ylab='Bending Stress [MPa]', col='blue', cex=0.2)

## ------------------------------------------------------------------------
library(moko)
library(lhs)

## ------------------------------------------------------------------------
n = 20
d = 2
set.seed(18)
doe <- optimumLHS(n,d)

## ---- fig.width=4, fig.height=4, fig.align='center', echo=FALSE----------
par(mar=c(3,2.5,0.5,0.5)+0.1, mgp = c(1.75, 0.5, 0))
plot(doe, pch=19, xlab = "normalized breadth", ylab='normalized height')

## ------------------------------------------------------------------------
fun <- nowacki_beam
res <- t(apply(doe, 1, fun))

## ---- echo=FALSE---------------------------------------------------------
print(round(res,3))

## ------------------------------------------------------------------------
model <- mkm(doe, res, modelcontrol = list(objective = 1:2, lower = rep(0.1, d)))

## ------------------------------------------------------------------------
which(model@feasible)

## ------------------------------------------------------------------------
model@design[model@feasible,]

## ------------------------------------------------------------------------
model@response[model@feasible,]

## ------------------------------------------------------------------------
model@response[model@feasible,model@objective]

## ------------------------------------------------------------------------
for (i in 21:40){
  pred_ps <- predict_front(model, lower = rep(0,d), upper = rep(1,d))
  pred_ps$sd <- predict(model, pred_ps$x)$norm_sd
  x_star <- pred_ps$x[which.max(pred_ps$sd),]
  y_star <- fun(x_star)
  model <- mkm(
    rbind(model@design, x_star), 
    rbind(model@response, y_star), 
    modelcontrol = model@control)
}

## ------------------------------------------------------------------------
actual_ps <- ps(model@response[model@feasible,model@objective])
print(igd(actual_ps, true_ps))

## ---- fig.width=4, fig.height=4, fig.align='center', echo=FALSE----------
par(mar=c(3,2.5,0.5,0.5)+0.1, mgp = c(1.75, 0.5, 0))
plot(true_ps$set, pch=20, xlab= expression(paste("Area [mm"^"2"*"]")), ylab='Bending Stress [MPa]', col='blue', cex=0.2)
points(model@response, col = ifelse(model@feasible, 'black', 'red'), pch=19)
points(actual_ps$set, col = 'green')

