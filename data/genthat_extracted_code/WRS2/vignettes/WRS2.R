## ----preliminaries, echo=FALSE, results='hide'---------------------------
library("knitr")
opts_chunk$set(highlight=FALSE, prompt=TRUE, background='#FFFFFF')
options(replace.assign=TRUE, width=72, prompt="R> ")

## ----setup, include=FALSE, cache=FALSE-----------------------------------
render_sweave()

## ----tmean---------------------------------------------------------------
library("WRS2")
timevec <- c(77, 87, 88, 114, 151, 210, 219, 246, 253, 262, 296, 299,
             306, 376, 428, 515, 666, 1310, 2611)
mean(timevec, 0.1)
trimse(timevec, 0.1)

## ----median--------------------------------------------------------------
median(timevec)
msmedse(timevec)

## ----winmean-------------------------------------------------------------
winmean(timevec, 0.1)
winse(timevec, 0.1)
winvar(timevec, 0.1)

## ----mest----------------------------------------------------------------
mest(timevec)
mestse(timevec)

## ----wincor--------------------------------------------------------------
library("reshape")
hangctr <- subset(hangover, subset = group == "alcoholic")
hangwide <- cast(hangctr, id ~ time, value = "symptoms")[,-1]
winall(hangwide)

## ----twocor, cache=TRUE--------------------------------------------------
ct1 <- subset(hangover, subset = (group == "control" & time == 1))$symp
ct2 <- subset(hangover, subset = (group == "control" & time == 2))$symp
at1 <- subset(hangover, subset = (group == "alcoholic" & time == 1))$symp
at2 <- subset(hangover, subset = (group == "alcoholic" & time == 2))$symp
set.seed(123)
twocor(ct1, ct2, at1, at2, corfun = "pbcor", beta = 0.15)

## ----soccer-plot1, echo=FALSE, fig.height = 6, fig.width = 12, dev='postscript'----
library("beanplot")
SpainGer <- subset(eurosoccer, League == "Spain" | League == "Germany")
SpainGer <- droplevels(SpainGer)
op <- par(mfrow = c(1,2))
boxplot(GoalsGame ~ League, data = SpainGer, main = "Boxplot Goals Scored per Game")
beanplot(GoalsGame ~ League, data = SpainGer, log = "", main = "Beanplot Goals Scored per Game",
         col = "coral")
par(op)

## ----yuen----------------------------------------------------------------
yuen(GoalsGame ~ League, data = SpainGer)

## ----yuenakp-------------------------------------------------------------
akp.effect(GoalsGame ~ League, data = SpainGer)

## ----yueneffect----------------------------------------------------------
set.seed(123)
yuen.effect.ci(GoalsGame ~ League, data = SpainGer)

## ----pb2gen--------------------------------------------------------------
set.seed(123)
pb2gen(GoalsGame ~ League, data = SpainGer, est = "median")
pb2gen(GoalsGame ~ League, data = SpainGer, est = "onestep")

## ----cache=TRUE----------------------------------------------------------
set.seed(123)
fitqt <- qcomhd(GoalsGame ~ League, data = SpainGer,
  q = c(0.1, 0.25, 0.5, 0.75, 0.95), nboot = 500)
fitqt

## ----ano-plot1, echo=FALSE, fig.height = 5, fig.width = 8, dev='postscript'----
library("MASS")
library("colorspace")
anorexiaFT <- subset(anorexia, subset = Treat == "FT")
colpal <- c(rainbow_hcl(17))
matplot(t(anorexiaFT[,2:3]), type = "b", cex = 0.8, main = "Weight Trajectories",
        xaxt = "n", ylab = "Weight (lbs.)", lty = 1, col = colpal, pch = 20)
axis(1, at = 1:2, labels = c("Prior", "Post"))

## ----yuend---------------------------------------------------------------
library("MASS")
anorexiaFT <- subset(anorexia, subset = Treat == "FT")
with(anorexiaFT, yuend(Prewt, Postwt))

## ----dqcomhd, cache=TRUE-------------------------------------------------
set.seed(123)
with(anorexiaFT, Dqcomhd(Prewt, Postwt, q = c(0.25, 0.5, 0.75)))

## ----binband-------------------------------------------------------------
g1 <- c(2, 4, 4, 2, 2, 2, 4, 3, 2, 4, 2, 3, 2, 4, 3, 2, 2, 3, 5, 5, 2, 2)
g2 <- c(5, 1, 4, 4, 2, 3, 3, 1, 1, 1, 1, 2, 2, 1, 1, 5, 3, 5)
binband(g1, g2, KMS = TRUE)

## ----soccer2-plot1, echo=FALSE, fig.height = 10, fig.width = 12, dev='postscript'----
anorexia$Wdiff <- anorexia$Postwt - anorexia$Prewt
op <- par(mfrow = c(2,1))
boxplot(Wdiff ~ Treat, data = anorexia, main = "Boxplot Anorexia Data")
beanplot(Wdiff ~ Treat, data = anorexia, log = "", main = "Beanplot Anorexia Data",
         col = "coral")
par(op)

## ----t1way---------------------------------------------------------------
anorexia$Wdiff <- anorexia$Postwt - anorexia$Prewt
set.seed(123)
t1way(Wdiff ~ Treat, data = anorexia)

## ----lincon--------------------------------------------------------------
lincon(Wdiff ~ Treat, data = anorexia)

## ----med1way-------------------------------------------------------------
set.seed(123)
med1way(Wdiff ~ Treat, data = anorexia)

## ----cache=TRUE, warning=FALSE-------------------------------------------
set.seed(123)
fitqa <- Qanova(Wdiff ~ Treat, data = anorexia,
   q = c(0.25, 0.5, 0.75))
fitqa

## ----goggles-plot1, echo=FALSE, fig.height = 6, fig.width = 12, dev='postscript',message=FALSE,results='hide', warning=FALSE----
tmean02 <- function(x) mean(x, tr = 0.2)
attach(goggles)
op <- par(mfrow = c(1,2))
interaction.plot(gender, alcohol, attractiveness, fun = tmean02, ylab = "Attractiveness", xlab = "Gender", type = "b", pch = 20,
                 lty = 1, col = c("black", "cadetblue", "coral"), main = "Interaction Plot Alcohol|Gender", legend = FALSE)
legend("right", legend = c("None", "2 Pints","4 Pints"), col = c("black", "cadetblue", "coral"), lty = 1, cex = 0.8)
interaction.plot(alcohol, gender, attractiveness, fun = tmean02, ylab = "Attractiveness", xlab = "Gender", type = "b", pch = 20,
                 lty = 1, col = c("coral", "black"), main = "Interaction Plot Gender|Alcohol", legend = FALSE)
legend("bottomleft", legend = c("female", "male"), col = c("coral", "black"), lty = 1, cex = 0.8)
par(op)
detach(goggles)

## ----t2way---------------------------------------------------------------
goggles$alcohol <- relevel(goggles$alcohol, ref = "None")
t2way(attractiveness ~ gender*alcohol, data = goggles)

## ------------------------------------------------------------------------
postgoggle <- mcp2atm(attractiveness ~ gender*alcohol, data = goggles)
postgoggle$contrasts

## ------------------------------------------------------------------------
postgoggle

## ----eval=FALSE----------------------------------------------------------
## set.seed(123)
## med2way(attractiveness ~ gender*alcohol, data = goggles)
## mcp2a(attractiveness ~ gender*alcohol, data = goggles, est = "median")
## pbad2way(attractiveness ~ gender*alcohol, data = goggles, est = "mom")
## mcp2a(attractiveness ~ gender*alcohol, data = goggles, est = "mom")

## ----swim-plot1, echo=FALSE, fig.height = 6, fig.width = 12, dev='postscript'----
tmean20 <- function(x) mean(x, trim = 0.20)
optpes.male <- subset(swimming, Sex == "Male")
optpes.female <- subset(swimming, Sex == "Female")
op <- par(mfrow = c(1,2))
interaction.plot(optpes.male$Event, optpes.male$Optim, optpes.male$Ratio, fun = tmean20,
                 xlab = "Event", ylab = "Ratio", main = "Interaction Men",
                 type = "b", pch = 20, lty = 1, col = 1:2, legend = FALSE)
legend("left", legend = c("Optimists", "Pessimists"), col = 1:2, lty = 1, cex = 0.8)
interaction.plot(optpes.female$Event, optpes.female$Optim, optpes.female$Ratio, fun = tmean20,
                 xlab = "Event", ylab = "Ratio", main = "Interaction Women",
                 type = "b", pch = 20, lty = 1, col = 1:2, legend = FALSE)
legend("topleft", legend = c("Optimists", "Pessimists"), col = 1:2, lty = 1, cex = 0.8)
par(op)

## ----t3way---------------------------------------------------------------
t3way(Ratio ~ Optim*Sex*Event, data = swimming)

## ----hang-plot1, echo=FALSE, fig.height = 5, fig.width = 8, dev='postscript'----
ind <- rep(1:6, each = 20)
symlist <- split(hangover$symptoms, ind)[c(1,4,2,5,3,6)]
gtmeans <- sapply(symlist, mean, trim = 0.2)
plot(1:3, type = "n", ylim = c(0, max(hangover$symptoms) + 10), xaxt = "n", xlab = "Time Points",
     ylab = "Number of Symptoms", main = "Hangover Data")
axis(1, at = 1:3, labels = paste("Time", 1:3))
for (i in 1:6) points(jitter(rep(ceiling(i/2), 20)), symlist[[i]], cex = 0.6, col = ((i %% 2) + 1))
legend("topleft", legend = c("control", "alcoholic"), lty = 1, col = 1:2)
lines(1:3, gtmeans[c(1, 3, 5)], col = 1, type = "b", pch = 19)
lines(1:3, gtmeans[c(2, 4, 6)], col = 2, type = "b", pch = 19)

## ----rmanova-------------------------------------------------------------
hangoverC <- subset(hangover, subset = group == "control")
with(hangoverC, rmanova(y = symptoms, groups = time, block = id))

## ----rmanovaph-----------------------------------------------------------
with(hangoverC, rmmcp(y = symptoms, groups = time, block = id))

## ----hangbw--------------------------------------------------------------
bwtrim(symptoms ~ group*time, id = id, data = hangover)

## ----cache=TRUE----------------------------------------------------------
set.seed(123)
sppbb(errorRatio ~ group*essay, id, data = essays)

## ----cache=TRUE----------------------------------------------------------
set.seed(123)
sppba(errorRatio ~ group*essay, id, data = essays, avg = FALSE)

## ----cache=TRUE----------------------------------------------------------
set.seed(123)
sppba(errorRatio ~ group*essay, id, data = essays)

## ----cache=TRUE----------------------------------------------------------
set.seed(123)
sppbi(errorRatio ~ group*essay, id, data = essays)

## ----smooth-plot1, echo=FALSE, fig.height = 6, fig.width = 12, dev='postscript'----
colpal <- c(rainbow_hcl(5, c = 100))
pal <- palette(colpal)
attach(chile)
op <- par(mfrow = c(1,2))
plot(length, heat, pch = 20, col = "gray", main = "Chile Smoothing I", xlab = "Length", ylab = "Heat")
fitmean <- runmean(length, heat)
fitmest <- rungen(length, heat)
fitmed <- rungen(length, heat, est = "median")
fitbag <- runmbo(length, heat, est = "onestep")
orderx <- order(length)
lines(length[orderx], fitmean[orderx], lwd = 2, col = 1)
lines(length[orderx], fitmest[orderx], lwd = 2, col = 2)
lines(length[orderx], fitmed[orderx], lwd = 2, col = 3)
lines(length[orderx], fitbag[orderx], lwd = 2, col = 4)
legend("topright", legend = c("Trimmed Mean", "MOM", "Median", "Bagged Onestep"), col = 1:4, lty = 1)
plot(length, heat, pch = 20, col = "gray", main = "Chile Smoothing II", xlab = "Length", ylab = "Heat")
fitmean1 <- runmean(length, heat, fr = 0.2)
fitmean2 <- runmean(length, heat, fr = 0.5)
fitmean3 <- runmean(length, heat, fr = 1)
fitmean4 <- runmean(length, heat, fr = 5)
orderx <- order(length)
lines(length[orderx], fitmean1[orderx], lwd = 2, col = 1)
lines(length[orderx], fitmean2[orderx], lwd = 2, col = 2)
lines(length[orderx], fitmean3[orderx], lwd = 2, col = 3)
lines(length[orderx], fitmean4[orderx], lwd = 2, col = 4)
legend("topright", legend = c("f = 0.2", "f = 0.5", "f = 1", "f = 5"), col = 1:4, lty = 1)
par(op)
palette(pal)
detach(chile)

## ----electric------------------------------------------------------------
comppts <- c(18, 70, 80, 90, 100, 110)
fitanc <- ancova(Posttest ~ Pretest + Group, fr1 = 0.3, fr2 = 0.3,
  data = electric, pts = comppts)
fitanc

## ----anc-plot1, echo=FALSE, fig.height = 6, fig.width = 9, dev='postscript'----
plot(electric$Pretest, electric$Posttest, col = rep(1:2, each = 96), pch = 1, cex = 0.8,
      xlab = "Pretest Score", ylab = "Posttest Score", main = "TV Show ANCOVA")
eltr <- subset(electric, subset = Group == "treatment")
elct <- subset(electric, subset = Group == "control")
ordtr <- order(eltr$Pretest)
lines(eltr$Pretest[ordtr], fitanc$fitted.values$treatment[ordtr], col = 1, lwd = 2)
abline(lm(eltr$Posttest ~ eltr$Pretest), col = 1, lty = 2)
ordct <- order(elct$Pretest)
lines(elct$Pretest[ordct], fitanc$fitted.values$control[ordct], col = 2, lwd = 2)
abline(lm(elct$Posttest ~ elct$Pretest), col = 2, lty = 2)
abline(v = comppts, lty = 2, col = "gray")
legend(30, 120, legend = c("treatment", "control"), lty = 1, col = 1:2)

## ----mediate, cache=TRUE, message=FALSE, warning=FALSE-------------------
library("mediation")
fit.mx <- lm(Esteem ~ MatCare, data = Leerkes)
fit.yxm <- lm(Efficacy ~ MatCare + Esteem, data = Leerkes)
set.seed(123)
fitmed <- mediation::mediate(fit.mx, fit.yxm, treat = "MatCare",
  mediator = "Esteem", sims = 999, boot = TRUE, boot.ci.type = "bca")
summary(fitmed)

## ----rmediate, cache=TRUE------------------------------------------------
set.seed(123)
with(Leerkes, ZYmediate(MatCare, Efficacy, Esteem, nboot = 2000))

