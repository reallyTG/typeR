## ----include = FALSE-----------------------------------------------------
library('knitr')
knit_theme$set('edit-kwrite')

## ----label = setup, include = FALSE--------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE, message = FALSE, warning = FALSE, widtht = 65,
                      cache.path = "./cache/Exercises/")
options(width = 65)

## ------------------------------------------------------------------------
library("mlogit")
#source("~/Forge/mlogit/chargement.R")
#ra <- lapply(system("ls ~/Dropbox/Forge/mlogit/pkg/R/*R", intern = TRUE), source)
#library("Formula");library("statmod");library("zoo");library("MASS");library("lmtest")
data("Heating", package = "mlogit")
H <- mlogit.data(Heating, shape = "wide", choice = "depvar", varying = c(3:12))
m <- mlogit(depvar ~ ic + oc | 0, H)
summary(m)

## ------------------------------------------------------------------------
apply(fitted(m, outcome = FALSE), 2, mean)

## ------------------------------------------------------------------------
coef(m)["oc"]/coef(m)["ic"]

## ------------------------------------------------------------------------
H$lcc <- H$ic + H$oc / 0.12
mlcc <- mlogit(depvar ~ lcc | 0, H)
lrtest(m, mlcc)
qchisq(0.05, df = 1, lower.tail = FALSE)

## ------------------------------------------------------------------------
mc <- mlogit(depvar ~ ic + oc, H, reflevel = 'hp')
summary(mc)
apply(fitted(mc, outcome = FALSE), 2, mean)

## ------------------------------------------------------------------------
wtp <- coef(mc)["oc"] / coef(mc)["ic"]
wtp
r <- 1 / wtp
r

## ------------------------------------------------------------------------
update(mc, reflevel = "gr")

## ------------------------------------------------------------------------
mi <- mlogit(depvar ~ oc + I(ic / income), H)
summary(mi)

## ------------------------------------------------------------------------
mi2 <- mlogit(depvar ~ oc + ic | income, H, reflevel = "hp")

## ------------------------------------------------------------------------
lrtest(mc, mi2)
waldtest(mc, mi2)
scoretest(mc, mi2)

## ------------------------------------------------------------------------
X <- model.matrix(mc)
alt <- index(H)$alt
chid <- index(H)$chid
eXb <- as.numeric(exp(X %*% coef(mc)))
SeXb <- tapply(eXb, chid, sum)
P <- eXb / SeXb[chid]
P <- matrix(P, ncol = 5, byrow = TRUE)
head(P)
apply(P, 2, mean)

## ------------------------------------------------------------------------
apply(fitted(mc, outcome = FALSE), 2, mean)

## ------------------------------------------------------------------------
Hn <- H
Hn[Hn$alt == "hp", "ic"] <- 0.9 * Hn[Hn$alt == "hp", "ic"]
apply(predict(mc, newdata = Hn), 2, mean)

## ------------------------------------------------------------------------
X <- model.matrix(mc)
Xn <- X[alt == "ec",]
Xn[, "ic"] <- Xn[, "ic"] + 200
Xn[, "oc"] <- Xn[, "oc"] * 0.75
unchid <- unique(index(H)$chid)
rownames(Xn) <- paste(unchid, 'new', sep = ".")
chidb <- c(chid, unchid)
X <- rbind(X, Xn)
X <- X[order(chidb), ]
eXb <- as.numeric(exp(X %*% coef(mc)))
SeXb <- as.numeric(tapply(eXb, sort(chidb), sum))
P <- eXb / SeXb[sort(chidb)]
P <- matrix(P, ncol = 6, byrow = TRUE)
apply(P, 2, mean)

## ----nest1---------------------------------------------------------------
data("HC", package = "mlogit")
HC <- mlogit.data(HC, varying = c(2:8, 10:16), choice = "depvar", shape = "wide")
cooling.modes <- index(HC)$alt %in% c('gcc', 'ecc', 'erc', 'hpc')
room.modes <- index(HC)$alt %in% c('erc', 'er')
# installation / operating costs for cooling are constants, 
# only relevant for mixed systems
HC$icca[!cooling.modes] <- 0
HC$occa[!cooling.modes] <- 0
# create income variables for two sets cooling and rooms
HC$inc.cooling <- HC$inc.room <- 0
HC$inc.cooling[cooling.modes] <- HC$income[cooling.modes]
HC$inc.room[room.modes] <- HC$income[room.modes]
# create an intercet for cooling modes
HC$int.cooling <- as.numeric(cooling.modes)
# estimate the model with only one nest elasticity
nl <- mlogit(depvar ~ ich + och +icca + occa + inc.room + inc.cooling + int.cooling | 0, HC,
             nests = list(cooling = c('gcc','ecc','erc','hpc'), 
             other = c('gc', 'ec', 'er')), un.nest.el = TRUE)
summary(nl)

## ------------------------------------------------------------------------
 (coef(nl)['iv'] - 1) / sqrt(vcov(nl)['iv', 'iv'])

## ------------------------------------------------------------------------
# First estimate the multinomial logit model
ml <- update(nl, nests = NULL)
lrtest(nl, ml)

## ------------------------------------------------------------------------
nl2 <- update(nl, nests = list(central = c('ec', 'ecc', 'gc', 'gcc', 'hpc'), 
                    room = c('er', 'erc')))
summary(nl2)

## ----tstat---------------------------------------------------------------
 (coef(nl2)['iv'] - 1) / sqrt(vcov(nl2)['iv', 'iv'])
lrtest(nl2, ml)

## ------------------------------------------------------------------------
logLik(nl)
logLik(nl2)

## ----nl3-----------------------------------------------------------------
nl3 <- update(nl, un.nest.el = FALSE)

## ----lrtest1-------------------------------------------------------------
lrtest(nl, nl3)

## ----threentest----------------------------------------------------------
nl4 <- update(nl, nests=list(n1 = c('gcc', 'ecc', 'erc'), n2 = c('hpc'),
                    n3 = c('gc', 'ec', 'er')))
summary(nl4)

## ------------------------------------------------------------------------
data("Electricity", package = "mlogit")
Electr <- mlogit.data(Electricity, id = "id", choice = "choice", 
                      varying = 3:26, shape = "wide", sep = "")

## ------------------------------------------------------------------------
Elec.mxl <- mlogit(choice ~ pf + cl + loc + wk + tod + seas | 0, Electr, 
              rpar=c(pf = 'n', cl = 'n', loc = 'n', wk = 'n', 
                     tod = 'n', seas = 'n'), 
              R = 100, halton = NA, panel = TRUE)
summary(Elec.mxl)

## ------------------------------------------------------------------------
coef(Elec.mxl)['cl'] / coef(Elec.mxl)['pf']

## ------------------------------------------------------------------------
pnorm(- coef(Elec.mxl)['cl'] / coef(Elec.mxl)['sd.cl'])

## ------------------------------------------------------------------------
pnorm(- coef(Elec.mxl)['pf'] / coef(Elec.mxl)['sd.pf'])

## ------------------------------------------------------------------------
Elec.mxl2 <- mlogit(choice ~ pf + cl + loc + wk + tod + seas | 0, Electr, 
                   rpar = c(cl = 'n', loc = 'n', wk = 'n', 
                            tod = 'n', seas = 'n'), 
                   R = 100, halton = NA,  panel = TRUE)

## ------------------------------------------------------------------------
summary(Elec.mxl2)

## ------------------------------------------------------------------------
Elec.mxl3 <- update(Elec.mxl, rpar = c(cl = 'n', loc = 'n', wk = 'u', 
                                       tod = 'n', seas = 'n'))

## ------------------------------------------------------------------------
summary(Elec.mxl3)
rpar(Elec.mxl3, 'wk')
summary(rpar(Elec.mxl3, 'wk'))

## ------------------------------------------------------------------------
plot(rpar(Elec.mxl3, 'wk'))

## ------------------------------------------------------------------------
Electr <- mlogit.data(Electricity, id = "id", choice = "choice", 
                      varying = 3:26, shape = "wide", sep = "",
                      opposite = c('tod', 'seas'))
Elec.mxl4 <- mlogit(choice ~ pf + cl + loc + wk + tod + seas | 0, Electr, 
              rpar = c(cl = 'n', loc = 'n', wk = 'u', tod = 'ln', seas = 'ln'), 
              R = 100, halton = NA, panel = TRUE)

## ------------------------------------------------------------------------
summary(Elec.mxl4)

## ------------------------------------------------------------------------
plot(rpar(Elec.mxl4, 'seas'))

## ------------------------------------------------------------------------
Elec.mxl5 <- update(Elec.mxl4, correlation = TRUE)

## ------------------------------------------------------------------------
summary(Elec.mxl5)
cor.mlogit(Elec.mxl5)
lrtest(Elec.mxl5, Elec.mxl4)
waldtest(Elec.mxl5, correlation = FALSE)
scoretest(Elec.mxl4, correlation = TRUE)

## ------------------------------------------------------------------------
data("Mode", package="mlogit")
Mo <- mlogit.data(Mode, choice = 'choice', shape = 'wide', 
                  varying = c(2:9))

## ------------------------------------------------------------------------
p1 <- mlogit(choice ~ cost + time, Mo, seed = 20, 
             R = 100, probit = TRUE)

## ------------------------------------------------------------------------
summary(p1)

## ------------------------------------------------------------------------
L1 <- matrix(0, 3, 3)
L1[!upper.tri(L1)] <- c(1, coef(p1)[6:10])

## ------------------------------------------------------------------------
L1 %*% t(L1)

## ------------------------------------------------------------------------
p2 <- mlogit(choice ~ cost + time, Mo, seed = 21, 
             R = 100, probit = TRUE)

## ------------------------------------------------------------------------
coef(p2)

## ------------------------------------------------------------------------
actShares <- with(Mo, tapply(choice, alt, mean))

## ------------------------------------------------------------------------
predShares <- apply(fitted(p1, outcome = FALSE), 2, mean)
predShares
sum(predShares)

## ------------------------------------------------------------------------
Mo2 <- Mo
Mo2[Mo2$alt == 'car', 'cost'] <- Mo2[Mo2$alt == 'car', 'cost'] * 2
newShares <- apply(predict(p1, newdata = Mo2), 2, mean)
cbind(original = actShares, new = newShares, 
      change = round((newShares - actShares) / actShares * 100))

