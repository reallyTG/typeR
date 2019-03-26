## ----echo=FALSE----------------------------------------------------------
require( doBy )
prettyVersion <- packageDescription("doBy")$Version
prettyDate <- format(Sys.Date())

## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
tidy=FALSE,fig.path='figures/LSmeans', fig.height=3.5 
)

## ----echo=FALSE, warning=FALSE----------------------------------------------------------
dir.create("figures")
oopt <- options()
options("digits"=4, "width"=90, "prompt"="> ", "continue"="  ")
##options(useFancyQuotes="UTF-8")

## ---------------------------------------------------------------------------------------
head(ToothGrowth, 4)
ftable(xtabs(~ dose + supp, data=ToothGrowth))

## ----echo=F, fig.cap="Plot of length against dose for difference sources of vitamin C."----
opar <- par(mfrow = c(1, 2), oma = c(0, 0, 1.1, 0))
plot(len  ~ dose, data = ToothGrowth, col = "lightgray",
     subset = supp == "OJ", main = "supp=OJ")
plot(len ~ dose, data = ToothGrowth, col = "lightgray",
     subset = supp == "VC", main = "supp=VC")
mtext("ToothGrowth data", side = 3, outer = TRUE)
par(opar)

## ----echo=F, fig.cap="Interaction plot between dose and source of vitamin C."-----------
with(ToothGrowth, interaction.plot(dose, supp, len))

## ---------------------------------------------------------------------------------------
ToothGrowth$dose <- factor(ToothGrowth$dose)
head(ToothGrowth)
tooth1 <- lm(len ~ dose + supp, data=ToothGrowth)
tooth2 <- lm(len ~ dose * supp, data=ToothGrowth)
anova(tooth1, tooth2)

## ---------------------------------------------------------------------------------------
tooth1

## ---------------------------------------------------------------------------------------
L <- matrix(c(1, 0, 0, 0, 
              1, 1, 0, 0,
              1, 0, 1, 0), nrow=3, byrow=T)

## ---------------------------------------------------------------------------------------
c1 <- linest(tooth1, L)
c1

## ---------------------------------------------------------------------------------------
summary(c1)
coef(c1)
confint(c1)

## ---------------------------------------------------------------------------------------
L <- LE_matrix(tooth1, effect="dose", at=list(supp="OJ"))
L

## ---------------------------------------------------------------------------------------
c1 <- esticon(tooth1, L)
c1

## ---------------------------------------------------------------------------------------
nd <- data.frame(dose=c('0.5', '1', '2'), supp='OJ')
nd
predict(tooth1, newdata=nd)

## ---------------------------------------------------------------------------------------
tooth0 <- update(tooth1, . ~ . - supp)
L0 <- LE_matrix(tooth0, effect="dose")
L0
linest(tooth0, L=L0)

## ---------------------------------------------------------------------------------------
L1 <- matrix(c(1, 0, 0, 0.5, 
               1, 1, 0, 0.5,
               1, 0, 1, 0.5), nrow=3, byrow=T)
linest(tooth1, L=L1)

## ---------------------------------------------------------------------------------------
L1 <- LE_matrix(tooth1, effect="dose")
L1

## ---------------------------------------------------------------------------------------
LSmeans(tooth1, effect="dose")

## ----results='hide'---------------------------------------------------------------------
L <- LE_matrix(tooth1, effect="dose")
le <- linest(tooth1, L=L)
coef(le)

## ---------------------------------------------------------------------------------------
LSmeans(tooth2, effect="dose")

## ---------------------------------------------------------------------------------------
L <- LE_matrix(tooth2, effect="dose")
t(L)

## ----chick-fig, fig.cap="ChickWeight data."---------------------------------------------
library(ggplot2)
ChickWeight$Diet <- factor(ChickWeight$Diet)
qplot(Time, weight, data=ChickWeight, colour=Chick, facets=~Diet,
      geom=c("point","line"))

## ---------------------------------------------------------------------------------------
library(lme4)
chick <- lmer(weight ~ Time * Diet + (0 + Time | Chick), 
           data=ChickWeight)
coef(summary(chick))

## ---------------------------------------------------------------------------------------
L <- LE_matrix(chick, effect="Diet")
t(L)

## ---------------------------------------------------------------------------------------
K1 <- LE_matrix(chick, effect="Diet", at=list(Time=1))
t(K1)

## ---------------------------------------------------------------------------------------
K0 <- LE_matrix(chick, effect="Diet", at=list(Time=0))
t(K1 - K0)
linest(chick, L=K1-K0)

## ---------------------------------------------------------------------------------------
LSmeans_trend <- function(object, effect, trend){
    L <- LE_matrix(object, effect=effect, at=as.list(setNames(1, trend))) -
        LE_matrix(object, effect=effect, at=as.list(setNames(0, trend)))
    linest(object, L=L)
}
LSmeans_trend(chick, effect="Diet", trend="Time")

## ---------------------------------------------------------------------------------------
data(CO2)
CO2 <- transform(CO2, Treat=Treatment, Treatment=NULL)
levels(CO2$Treat) <- c("nchil","chil")
levels(CO2$Type) <- c("Que","Mis")
ftable(xtabs( ~ Plant + Type + Treat, data=CO2), col.vars=2:3)

## ----co2-fig, fig.cap="CO2 data"--------------------------------------------------------
qplot(x=log(conc), y=uptake, data=CO2, color=Treat, facets=~Type)

## ---------------------------------------------------------------------------------------
co2.lm1 <- lm(uptake ~ conc + Type + Treat, data=CO2)
LSmeans(co2.lm1, effect="Treat")

## ----eval=F-----------------------------------------------------------------------------
#  co2.lm <- lm(uptake ~ log(conc) + Type + Treat, data=CO2)
#  LSmeans(co2.lm, effect="Treat")

## ---------------------------------------------------------------------------------------
co2.lm2 <- lm(uptake ~ log.conc + Type + Treat,
             data=transform(CO2, log.conc=log(conc)))
LSmeans(co2.lm2, effect="Treat")

## ---------------------------------------------------------------------------------------
co2.lm3 <- lm(uptake ~ conc + I(conc^2) + Type + Treat, data=CO2)
LSmeans(co2.lm3, effect="Treat")

## ---------------------------------------------------------------------------------------
co2.lm4 <- lm(uptake ~ conc + conc2 + Type + Treat, data=
              transform(CO2, conc2=conc^2))
LSmeans(co2.lm4, effect="Treat")

## ---------------------------------------------------------------------------------------
LSmeans(co2.lm4, effect="Treat", at=list(conc=10, conc2=100))

## ---------------------------------------------------------------------------------------
tooth.gam <- glm(len ~ dose + supp, family=Gamma, data=ToothGrowth)
LSmeans(tooth.gam, effect="dose", type="link")
LSmeans(tooth.gam, effect="dose", type="response")

## ---------------------------------------------------------------------------------------
library(lme4)
tooth.mm <- lmer( len ~ dose  + (1|supp), data=ToothGrowth)
LSmeans(tooth1, effect="dose")
LSmeans(tooth.mm, effect="dose")

## ---------------------------------------------------------------------------------------
VarCorr(tooth.mm)

## ----echo=F, results='hide'-------------------------------------------------------------
LSmeans(tooth.mm, effect="dose", adjust.df=FALSE)

## ---------------------------------------------------------------------------------------
library(geepack)
tooth.gee <- geeglm(len ~ dose, id=supp, family=Gamma, data=ToothGrowth)
LSmeans(tooth.gee, effect="dose")
LSmeans(tooth.gee, effect="dose", type="response")

## ---------------------------------------------------------------------------------------
## Make balanced dataset
dat.bal <- expand.grid(list(AA=factor(1:2), BB=factor(1:3), CC=factor(1:3)))
dat.bal$y <- rnorm(nrow(dat.bal))

## Make unbalanced dataset:  'BB' is nested within 'CC' so BB=1
## is only found when CC=1 and BB=2,3 are found in each CC=2,3,4
dat.nst <- dat.bal
dat.nst$CC <-factor(c(1,1,2,2,2,2,1,1,3,3,3,3,1,1,4,4,4,4))

## ---------------------------------------------------------------------------------------
dat.nst

## ---------------------------------------------------------------------------------------
head(dat.nst, 4)
ftable(xtabs( ~ AA + BB + CC, data=dat.nst), row.vars="AA")

## ---------------------------------------------------------------------------------------
mod.nst  <- lm(y ~ AA + BB : CC, data=dat.nst)
coef(summary(mod.nst))

## ---------------------------------------------------------------------------------------
lsm.BC <- LSmeans(mod.nst, effect=c("BB", "CC"))
lsm.BC
lsm.BC2 <- LSmeans(mod.nst, effect="BB", at=list(CC=2))
lsm.BC2

## ---------------------------------------------------------------------------------------
X <- model.matrix( mod.nst ) 
Matrix::rankMatrix(X)
dim(X)
as(X, "Matrix")

## ---------------------------------------------------------------------------------------
L <- LE_matrix(mod.nst, effect="BB", at=list(CC=2))
t(L)
linest(mod.nst, L=L)

## ---------------------------------------------------------------------------------------
XtXinv <- MASS::ginv(t(X)%*%X)
bhat <- as.numeric(XtXinv %*% t(X) %*% dat.nst$y)
zapsmall(bhat)
L %*% bhat

## ---------------------------------------------------------------------------------------
S <- svd(X)
B <- S$v[, S$d < 1e-10, drop=FALSE ]; 
head(B) ## Basis for N(X)

## ---------------------------------------------------------------------------------------
rowSums(L %*% B)

## ---------------------------------------------------------------------------------------
lsm.BC2

## ---------------------------------------------------------------------------------------
library("multcomp")
g1 <- glht(tooth1, mcp(dose="Tukey"))
summary( g1 )

## ---------------------------------------------------------------------------------------
L <- g1$linfct
L

## ----eval=F-----------------------------------------------------------------------------
#  glht(tooth1, linfct=L)

