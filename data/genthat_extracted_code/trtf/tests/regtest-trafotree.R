
library("trtf")
library("survival")
data("GBSG2", package = "TH.data")
set.seed(290875)
### Make UL and Windooze happy
options(digits = 5)

yvar <- numeric_var("y", support = c(100, 2000), bounds = c(0, Inf))
By <- Bernstein_basis(yvar, order = 5, ui = "incre")
m <- ctm(response = By, todistr = "MinExt")
GBSG2$y <- with(GBSG2, Surv(time, cens))

ctrl <- ctree_control(splitstat = "quad", teststat = "quad", minsplit = 40, minbucket = 20)
st2 <- trafotree(m, formula = y ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, control = ctrl, data = GBSG2)

coef(st2)
logLik(st2)
logLik(st2, newdata = GBSG2)
logLik(st2, newdata = GBSG2[1:10,])
sum(sapply(1:10, function(i) logLik(st2, newdata = GBSG2[i,, drop = FALSE])))

predict(st2, newdata = GBSG2[1:3,], type = "node")
predict(st2, newdata = GBSG2[1:3,], type = "coef")
predict(st2, newdata = GBSG2[1:3,], type = "hazard")

plot(st2, tp_args = list(type = "survivor"))

st21 <- st2
class(st21) <- class(st21)[-1L]
plot(st21)

simulate(st2, newdata = GBSG2[1:3,], nsim = 3)

st1 <- ctree(y ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, data = GBSG2, control = ctrl)
plot(st1)

n1 <- predict(st1, type = "node")
n2 <- predict(st2, type = "node")

table(n1, n2)
