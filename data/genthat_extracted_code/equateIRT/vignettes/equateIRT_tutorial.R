## ------------------------------------------------------------------------
library("equateIRT")
data("data2pl", package = "equateIRT")

## ---- message=FALSE------------------------------------------------------
library("ltm")
m1 <- ltm(data2pl[[1]] ~ z1)
m2 <- ltm(data2pl[[2]] ~ z1)
m3 <- ltm(data2pl[[3]] ~ z1)
m4 <- ltm(data2pl[[4]] ~ z1)
m5 <- ltm(data2pl[[5]] ~ z1)

## ------------------------------------------------------------------------
estm1 <- import.ltm(m1, display = FALSE)
estm2 <- import.ltm(m2, display = FALSE)
estm3 <- import.ltm(m3, display = FALSE)
estm4 <- import.ltm(m4, display = FALSE)
estm5 <- import.ltm(m5, display = FALSE)
estm1$coef[1:3, ]
estm1$var[1:3, 1:3]

## ------------------------------------------------------------------------
estc <- list(estm1$coef, estm2$coef, estm3$coef, estm4$coef, estm5$coef)
estv <- list(estm1$var, estm2$var, estm3$var, estm4$var, estm5$var)
test <- paste("test", 1:5, sep = "")

## ------------------------------------------------------------------------
mod2pl <- modIRT(coef = estc, var = estv, names = test, display = FALSE)
coef(mod2pl$test1)[1:5]

## ------------------------------------------------------------------------
lplan<-linkp(coef = estc)
lplan

## ---- message=FALSE, fig.cap="Linkage plan",fig.width=3.5,fig.height=3----
library(sna)
par(mar=c(0, 0, 0, 0))
set.seed(6)
gplot(lplan, displaylabels = TRUE,  vertex.sides = 4, vertex.cex = 5, vertex.rot =45,  usearrows = FALSE, label.pos = 5, label.cex = 1, vertex.col = 0)

## ------------------------------------------------------------------------
l12 <- direc(mods = mod2pl, which = c(1,2), method = "mean-mean")
l12
summary(l12)

## ------------------------------------------------------------------------
direclist2pl <- alldirec(mods = mod2pl, method = "mean-mean")
direclist2pl

## ------------------------------------------------------------------------


## ------------------------------------------------------------------------
summary(direclist2pl, link="test1.test2")

## ------------------------------------------------------------------------
cec4 <- chainec(r = 4, direclist = direclist2pl)
cec4
summary(cec4, path="test1.test2.test3.test4")

## ------------------------------------------------------------------------
summary(cec4, path="test1.test2.test3.test4")

## ------------------------------------------------------------------------
cec14 <- chainec(r = 4, direclist = direclist2pl, f1 = "test1", f2 = "test4")
cec14
summary(cec14)

## ------------------------------------------------------------------------
pth <- paste("test", c(1,5,4), sep = "")
chainec154 <- chainec(direclist = direclist2pl, pths = pth)
summary(chainec154)

## ------------------------------------------------------------------------
ecall <- c(cec14, chainec154)
fec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)
fec
summary(fec)

## ------------------------------------------------------------------------
 eqc(fec)

## ------------------------------------------------------------------------
itm(fec, bistype = "weighted")

## ------------------------------------------------------------------------
score(fec, bistype = "weighted")

## ------------------------------------------------------------------------
score(fec, method = "OSE", bistype = "weighted")

## ------------------------------------------------------------------------
score(chainec154, scores = 17)
score(cec4, path = "test1.test2.test3.test4", scores = 17)
score(fec, bistype = "unweighted", scores = 17)
score(fec, bistype = "weighted", scores = 17)

