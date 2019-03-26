
library("trtf")
library("partykit")
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

predict(st2, newdata = GBSG2[1:3,], type = "node")
predict(st2, newdata = GBSG2[1:3,], type = "coef")
predict(st2, newdata = GBSG2[1:3,], type = "hazard")

plot(st2, tp_args = list(type = "survivor"))

class(st2) <- class(st2)[-1L]
plot(st2)

st1 <- ctree(y ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, data = GBSG2, control = ctrl)
plot(st1)

n1 <- predict(st1, type = "node")
n2 <- predict(st2, type = "node")

table(n1, n2)

tf <- traforest(m, formula = y ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, data = GBSG2, 
    control = ctree_control(splitstat = "quad", teststat = "quad",
                    testtype = "Teststatistic", mincriterion = 1, minbucket = 50), 
    ntree = 50, trace = FALSE, cores = 1)

w <- predict(tf, newdata = GBSG2[1:3,], type = "weights")

cf <- coef(mlt(m, data = GBSG2))
coef(m1 <- mlt(m, data = GBSG2, weights = w[,1], theta = cf))
coef(m2 <- mlt(m, data = GBSG2, weights = w[,2], theta = cf))
coef(m3 <- mlt(m, data = GBSG2, weights = w[,3], theta = cf))

layout(matrix(1:3, nr = 1))
plot(m1, newdata = data.frame(1), type = "survivor")
plot(m2, newdata = data.frame(1), type = "survivor", add = TRUE)
plot(m3, newdata = data.frame(1), type = "survivor", add = TRUE)


cmod <- coxph(Surv(time, cens) ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, data = GBSG2)

plot(survfit(cmod, newdata = GBSG2[1:3,]))

sf <-  cforest(formula = y ~ horTh + age + menostat + tsize + tgrade +
    pnodes + progrec + estrec, data = GBSG2, 
    control = ctree_control(splitstat = "quad", teststat = "quad",
                    testtype = "Teststatistic", mincriterion = 1, minbucket = 50),
    ntree = 50, trace = FALSE)

w <- predict(sf, newdata = GBSG2[1:3,], type = "weights")

cf <- coef(mlt(m, data = GBSG2))
coef(m1 <- mlt(m, data = GBSG2, weights = w[,1], theta = cf))
coef(m2 <- mlt(m, data = GBSG2, weights = w[,2], theta = cf))
coef(m3 <- mlt(m, data = GBSG2, weights = w[,3], theta = cf))

plot(m1, newdata = data.frame(1), type = "survivor")
plot(m2, newdata = data.frame(1), type = "survivor", add = TRUE)
plot(m3, newdata = data.frame(1), type = "survivor", add = TRUE)
