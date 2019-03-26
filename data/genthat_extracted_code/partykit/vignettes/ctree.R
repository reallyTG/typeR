### R code from vignette source 'ctree.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
options(width = 70, SweaveHooks = list(leftpar = 
    function() par(mai = par("mai") * c(1, 1.1, 1, 1))))
require("partykit")
require("coin")
require("strucchange")
require("coin")
require("Formula")
require("survival")
require("sandwich")
set.seed(290875)


###################################################
### code chunk number 2: party-max
###################################################
ctree_control(teststat = "max")


###################################################
### code chunk number 3: party-max
###################################################
ctree_control(teststat = "quad")


###################################################
### code chunk number 4: party-Bonf
###################################################
ctree_control(testtype = "Bonferroni")


###################################################
### code chunk number 5: party-minsplit
###################################################
ctree_control(minsplit = 20)


###################################################
### code chunk number 6: party-maxsurr
###################################################
ctree_control(maxsurrogate = 3)


###################################################
### code chunk number 7: party-data
###################################################
ls <- data.frame(y = gl(3, 50, labels = c("A", "B", "C")), 
                 x1 = rnorm(150) + rep(c(1, 0, 0), c(50, 50, 50)), 
                 x2 = runif(150))


###################################################
### code chunk number 8: party-formula
###################################################
library("partykit")
ctree(y ~ x1 + x2, data = ls)


###################################################
### code chunk number 9: party-fitted
###################################################
ct <- ctree(y ~ x1 + x2, data = ls)


###################################################
### code chunk number 10: party-print
###################################################
ct


###################################################
### code chunk number 11: party-plot
###################################################
plot(ct)


###################################################
### code chunk number 12: party-nodes
###################################################
ct[1]


###################################################
### code chunk number 13: party-nodelist
###################################################
class(ct[1])


###################################################
### code chunk number 14: party-predict
###################################################
predict(ct, newdata = ls)


###################################################
### code chunk number 15: party-treeresponse
###################################################
predict(ct, newdata = ls[c(1, 51, 101),], type = "prob")


###################################################
### code chunk number 16: party-where
###################################################
predict(ct, newdata = ls[c(1,51,101),], type = "node")


###################################################
### code chunk number 17: party-sctest
###################################################
library("strucchange")
sctest(ct)


###################################################
### code chunk number 18: treepipit-ctree
###################################################
data("treepipit", package = "coin")
tptree <- ctree(counts ~ ., data = treepipit)


###################################################
### code chunk number 19: treepipit-plot
###################################################
plot(tptree, terminal_panel = node_barplot)


###################################################
### code chunk number 20: treepipit-x
###################################################
p <- info_node(node_party(tptree))$p.value
n <- table(predict(tptree, type = "node"))


###################################################
### code chunk number 21: glaucoma-ctree
###################################################
data("GlaucomaM", package = "TH.data")
gtree <- ctree(Class ~ ., data = GlaucomaM)


###################################################
### code chunk number 22: glaucoma-x
###################################################
sp <- split_node(node_party(gtree))$varID


###################################################
### code chunk number 23: glaucoma-plot
###################################################
plot(gtree)


###################################################
### code chunk number 24: glaucoma-plot-inner
###################################################
plot(gtree, inner_panel = node_barplot, 
     edge_panel = function(...) invisible(), tnex = 1)


###################################################
### code chunk number 25: glaucoma-plot2 (eval = FALSE)
###################################################
## plot(gtree)


###################################################
### code chunk number 26: glaucoma-plot-inner (eval = FALSE)
###################################################
## plot(gtree, inner_panel = node_barplot, 
##      edge_panel = function(...) invisible(), tnex = 1)


###################################################
### code chunk number 27: glaucoma-prediction
###################################################
table(predict(gtree), GlaucomaM$Class)


###################################################
### code chunk number 28: glaucoma-classprob
###################################################
prob <- predict(gtree, type = "prob")[,1] + 
                runif(nrow(GlaucomaM), min = -0.01, max = 0.01)
splitvar <- character_split(split_node(node_party(gtree)), 
                            data = data_party(gtree))$name
plot(GlaucomaM[[splitvar]], prob, 
     pch = as.numeric(GlaucomaM$Class), ylab = "Conditional Class Prob.",
     xlab = splitvar)
abline(v = split_node(node_party(gtree))$breaks, lty = 2)
legend(0.15, 0.7, pch = 1:2, legend = levels(GlaucomaM$Class), bty = "n")


###################################################
### code chunk number 29: GBSGS-ctree
###################################################
data("GBSG2", package = "TH.data")  
library("survival")
(stree <- ctree(Surv(time, cens) ~ ., data = GBSG2))


###################################################
### code chunk number 30: GBSG2-plot
###################################################
plot(stree)


###################################################
### code chunk number 31: GBSG2-KM
###################################################
pn <- predict(stree, newdata = GBSG2[1:2,], type = "node")
n <- predict(stree, type = "node")
survfit(Surv(time, cens) ~ 1, data = GBSG2, subset = (n == pn[1]))
survfit(Surv(time, cens) ~ 1, data = GBSG2, subset = (n == pn[2]))


###################################################
### code chunk number 32: mammo-ctree
###################################################
data("mammoexp", package = "TH.data")
mtree <- ctree(ME ~ ., data = mammoexp)


###################################################
### code chunk number 33: mammo-plot
###################################################
plot(mtree)


###################################################
### code chunk number 34: spider-ctree
###################################################
data("HuntingSpiders", package = "partykit")
sptree <- ctree(arct.lute + pard.lugu + zora.spin + pard.nigr +
  pard.pull + aulo.albi + troc.terr + alop.cune + pard.mont + alop.acce +
  alop.fabr + arct.peri ~ herbs + reft + moss + sand + twigs + water,
  data = HuntingSpiders, teststat = "max", minsplit = 5,
  pargs = GenzBretz(abseps = .1, releps = .1))


###################################################
### code chunk number 35: spider-plot1
###################################################
plot(sptree, terminal_panel = node_barplot)


###################################################
### code chunk number 36: spider-plot2
###################################################
plot(sptree)


###################################################
### code chunk number 37: party-setup
###################################################
library("party")
set.seed(290875)


###################################################
### code chunk number 38: party-airq
###################################################
data("airquality", package = "datasets")
airq <- subset(airquality, !is.na(Ozone))
(airct_party <- party::ctree(Ozone ~ ., data = airq, 
     controls = party::ctree_control(maxsurrogate = 3)))
mean((airq$Ozone - predict(airct_party))^2)


###################################################
### code chunk number 39: partykit-airq
###################################################
(airct_partykit <- partykit::ctree(Ozone ~ ., data = airq, 
     control = partykit::ctree_control(maxsurrogate = 3, 
                                       numsurrogate = TRUE)))
mean((airq$Ozone - predict(airct_partykit))^2)
table(predict(airct_party, type = "node"),
      predict(airct_partykit, type = "node"))
max(abs(predict(airct_party) - predict(airct_partykit)))


###################################################
### code chunk number 40: party-partykit-airq
###################################################
airct_party@tree$criterion
info_node(node_party(airct_partykit))


###################################################
### code chunk number 41: party-partykit-iris
###################################################
(irisct_party <- party::ctree(Species ~ .,data = iris))
(irisct_partykit <- partykit::ctree(Species ~ .,data = iris, 
control = partykit::ctree_control(splitstat = "maximum")))
table(predict(irisct_party, type = "node"),
      predict(irisct_partykit, type = "node"))


###################################################
### code chunk number 42: party-iris
###################################################
tr_party <- treeresponse(irisct_party, newdata = iris)


###################################################
### code chunk number 43: partykit-iris
###################################################
tr_partykit <- predict(irisct_partykit, type = "prob", 
                       newdata = iris)
max(abs(do.call("rbind", tr_party) - tr_partykit))


###################################################
### code chunk number 44: party-partykit-mammoexp
###################################################
### ordinal regression
data("mammoexp", package = "TH.data")
(mammoct_party <- party::ctree(ME ~ ., data = mammoexp))
### estimated class probabilities
tr_party <- treeresponse(mammoct_party, newdata = mammoexp)
(mammoct_partykit <- partykit::ctree(ME ~ ., data = mammoexp))
### estimated class probabilities
tr_partykit <- predict(mammoct_partykit, newdata = mammoexp, type = "prob")
max(abs(do.call("rbind", tr_party) - tr_partykit))


###################################################
### code chunk number 45: party-partykit-GBSG2
###################################################
data("GBSG2", package = "TH.data")
(GBSG2ct_party <- party::ctree(Surv(time, cens) ~ .,data = GBSG2))
(GBSG2ct_partykit <- partykit::ctree(Surv(time, cens) ~ .,data = GBSG2))


###################################################
### code chunk number 46: party-partykit-KM
###################################################
tr_party <- treeresponse(GBSG2ct_party, newdata = GBSG2)
tr_partykit <- predict(GBSG2ct_partykit, newdata = GBSG2, type = "prob")
all.equal(lapply(tr_party, function(x) unclass(x)[!(names(x) %in% "call")]),
lapply(tr_partykit, function(x) unclass(x)[!(names(x) %in% "call")]),
check.names = FALSE)


###################################################
### code chunk number 47: nf-alpha
###################################################
(airct_partykit_1 <- partykit::ctree(Ozone ~ ., data = airq, 
     control = partykit::ctree_control(maxsurrogate = 3, alpha = 0.001,
                                       numsurrogate = FALSE)))
depth(airct_partykit_1)
mean((airq$Ozone - predict(airct_partykit_1))^2)


###################################################
### code chunk number 48: nf-maxstat
###################################################
(airct_partykit <- partykit::ctree(Ozone ~ ., data = airq, 
     control = partykit::ctree_control(maxsurrogate = 3, splittest = TRUE,
                                       testtype = "MonteCarlo"))) 


###################################################
### code chunk number 49: nf-nmax
###################################################
(irisct_partykit_1 <- partykit::ctree(Species ~ .,data = iris, 
control = partykit::ctree_control(splitstat = "maximum", nmax = 25)))
table(predict(irisct_partykit), predict(irisct_partykit_1))


###################################################
### code chunk number 50: nf-multiway
###################################################
GBSG2$tgrade <- factor(GBSG2$tgrade, ordered = FALSE)
(GBSG2ct_partykit <- partykit::ctree(Surv(time, cens) ~ tgrade,
    data = GBSG2, control = partykit::ctree_control(multiway = TRUE, 
                                                    alpha = .5)))


###################################################
### code chunk number 51: nf-cluster
###################################################
airq$month <- factor(airq$Month)
(airct_partykit_3 <- partykit::ctree(Ozone ~ Solar.R + Wind + Temp, data = airq,
cluster = month, control = partykit::ctree_control(maxsurrogate = 3)))
info_node(node_party(airct_partykit_3))
mean((airq$Ozone - predict(airct_partykit_3))^2)


###################################################
### code chunk number 52: nf-ytrafo-1
###################################################
### with weight-dependent log-rank scores
### log-rank trafo for observations in this node only (= weights > 0)
h <- function(y, x, start = NULL, weights, offset, estfun = TRUE, object = FALSE, ...) {
    if (is.null(weights)) weights <- rep(1, NROW(y))
    s <- logrank_trafo(y[weights > 0,,drop = FALSE])
    r <- rep(0, length(weights))
    r[weights > 0] <- s
    list(estfun = matrix(as.double(r), ncol = 1), converged = TRUE, unweighted = TRUE)
}
partykit::ctree(Surv(time, cens) ~ ., data = GBSG2, ytrafo = h)


###################################################
### code chunk number 53: nf-ytrafo-2
###################################################
### normal varying intercept / varying coefficient model (aka "mob")
h <- function(y, x, start = NULL, weights = NULL, offset = NULL, cluster = NULL, ...)
  glm(y ~ 0 + x, family = gaussian(), start = start, weights = weights, ...)
(airct_partykit_4 <- partykit::ctree(Ozone ~ Temp | Solar.R + Wind, 
    data = airq, cluster = month, ytrafo = h, 
    control = partykit::ctree_control(maxsurrogate = 3)))
airq$node <- factor(predict(airct_partykit_4, type = "node"))
summary(m <- glm(Ozone ~ node + node:Temp - 1, data = airq))
mean((predict(m) - airq$Ozone)^2)


###################################################
### code chunk number 54: airq-mob
###################################################
airq_lmtree <- partykit::lmtree(Ozone ~ Temp | Solar.R + Wind, 
                                data = airq, cluster = month)
info_node(node_party(airq_lmtree))
mean((predict(airq_lmtree, newdata = airq) - airq$Ozone)^2)


###################################################
### code chunk number 55: closing
###################################################
detach(package:party)


