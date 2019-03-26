## ----include = FALSE-----------------------------------------------------
library('knitr')
knit_theme$set('edit-kwrite')

## ----label = setup, include = FALSE--------------------------------------
knitr::opts_chunk$set(echo = TRUE, cache = TRUE, message = FALSE, warning = FALSE, widtht = 65,
                      cache.path = "./cache/mlogit/")
options(width = 65)

## ------------------------------------------------------------------------
library("mlogit")
#ra <- lapply(system("ls ~/Dropbox/Forge/mlogit/pkg/R/*R", intern = TRUE), source)
#library("Formula");library("statmod");library("zoo");library("MASS");library("lmtest")

## ------------------------------------------------------------------------
data("Fishing", package = "mlogit")
head(Fishing, 3)

## ------------------------------------------------------------------------
data("TravelMode", package="AER")
head(TravelMode)

## ------------------------------------------------------------------------
Fish <- mlogit.data(Fishing, shape="wide", varying=2:9, choice="mode")

## ------------------------------------------------------------------------
head(Fish, 5)

## ------------------------------------------------------------------------
head(index(Fish))

## ------------------------------------------------------------------------
TM <- mlogit.data(TravelMode,
choice = "choice", shape = "long", alt.levels = c("air", "train",
"bus", "car"))

## ------------------------------------------------------------------------
TM <- mlogit.data(TravelMode ,choice = "choice", shape = "long",
                  alt.var = "mode")

## ------------------------------------------------------------------------
TM <- mlogit.data(TravelMode, choice = "choice",
                  shape = "long", chid.var = "individual",
                  alt.levels = c("air", "train", "bus", "car"))

## ------------------------------------------------------------------------
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long",
                 chid.var = "individual", alt.var = "mode")

## ------------------------------------------------------------------------
TM <- mlogit.data(TravelMode, choice = "choice", shape = "long",
                 chid.var = "individual", alt.var = "mode", drop.index = TRUE)
head(TM)

## ------------------------------------------------------------------------
data("Train", package="mlogit")
head(Train, 3)

## ------------------------------------------------------------------------
Tr <- mlogit.data(Train, shape = 'wide', choice = "choice", id = "id",
                  varying = 4:11, sep = "_", alt.levels = c("A", "B")) 
head(Tr, 3)
head(index(Tr), 3)

## ------------------------------------------------------------------------
f <- mFormula(choice ~ vcost | income + size | travel)

## ------------------------------------------------------------------------
f2 <- mFormula(choice ~ vcost + travel | income + size)
f2 <- mFormula(choice ~ vcost + travel | income + size | 0)

## ------------------------------------------------------------------------
f3 <- mFormula(choice ~ 0 | income | 0)
f3 <- mFormula(choice ~ 0 | income)

## ------------------------------------------------------------------------
f4 <- mFormula(choice ~ vcost + travel)
f4 <- mFormula(choice ~ vcost + travel | 1)
f4 <- mFormula(choice ~ vcost + travel | 1 | 0)

## ------------------------------------------------------------------------
f5 <- mFormula(choice ~ vcost | 0 | travel)
f6 <- mFormula(choice ~ vcost | income + 0 | travel)
f6 <- mFormula(choice ~ vcost | income -1 | travel)
f7 <- mFormula(choice ~ 0 | income -1 | travel)

## ------------------------------------------------------------------------
f <- mFormula(choice ~ vcost | income  | travel)
head(model.matrix(f, TM))

## ------------------------------------------------------------------------
data("Train", package="mlogit")
Tr <- mlogit.data(Train, shape = 'wide', choice = "choice", 
                  varying = 4:11, sep = "_", alt.levels = c("A", "B"), id = "id")


## ------------------------------------------------------------------------
Tr$price <- Tr$price / 100 * 2.20371
Tr$time <- Tr$time / 60

## ------------------------------------------------------------------------
ml.Train <- mlogit(choice~price+time+change+comfort | -1, Tr)
summary(ml.Train)

## ------------------------------------------------------------------------
coef(ml.Train)[-1]/coef(ml.Train)[1]

## ------------------------------------------------------------------------
Fish <- mlogit.data(Fishing, shape="wide", varying=2:9, choice="mode")
ml.Fish <- mlogit(mode~price | income | catch, Fish)

## ------------------------------------------------------------------------
ml.Fish <- mlogit(mode~price | income | catch, Fishing, shape = "wide", varying = 2:9)
summary(ml.Fish)

## ------------------------------------------------------------------------
head(fitted(ml.Fish))
head(fitted(ml.Fish, outcome=FALSE))

## ------------------------------------------------------------------------
mlogit(mode~price | income | catch, Fish, reflevel='charter', 
       alt.subset=c('beach', 'pier', 'charter'))

## ------------------------------------------------------------------------
data("Game", package = "mlogit")
data("Game2", package = "mlogit")
head(Game,2)
head(Game2, 7)
nrow(Game)
nrow(Game2)

## ------------------------------------------------------------------------
G <- mlogit.data(Game2, shape="long", choice="ch", alt.var='platform', ranked=TRUE)
G <- mlogit.data(Game, shape="wide", choice="ch", varying=1:12, ranked=TRUE)
head(G)
nrow(G)

## ------------------------------------------------------------------------
summary(mlogit(ch~own|hours+age, G, reflevel="PC"))

## ------------------------------------------------------------------------
data("ModeCanada", package = "mlogit")

## ------------------------------------------------------------------------
busUsers <- with(ModeCanada, case[choice == 1 & alt == 'bus'])
Bhat <- subset(ModeCanada, !case %in% busUsers & alt != 'bus' & noalt == 4)
Bhat$alt <- Bhat$alt[drop = TRUE]
Bhat <- mlogit.data(Bhat, shape='long', chid.var = 'case',
                    alt.var = 'alt', choice='choice',
                    drop.index=TRUE)


## ------------------------------------------------------------------------
ml.MC <- mlogit(choice ~ freq + cost + ivt + ovt | urban + income, Bhat, reflevel = 'car')
hl.MC <- mlogit(choice ~ freq + cost + ivt + ovt | urban + income, Bhat, reflevel = 'car', heterosc = TRUE)
summary(hl.MC)

## ------------------------------------------------------------------------
data("TravelMode",package="AER")
TravelMode <- mlogit.data(TravelMode,choice="choice",shape="long",
                          alt.var="mode",chid.var="individual")
TravelMode$avinc <- with(TravelMode,(mode=='air')*income)
ml.TM <- mlogit(choice ~ wait + gcost + avinc, TravelMode, 
                reflevel = "car")
hl.TM <- mlogit(choice ~ wait + gcost + avinc, TravelMode, 
             reflevel = "car", heterosc = TRUE)
summary(hl.TM)

## ------------------------------------------------------------------------
c(coef(hl.TM)[7:9], sp.car = 1)*pi/sqrt(6)

## ------------------------------------------------------------------------
data("TravelMode",package="AER")
TravelMode <- mlogit.data(TravelMode,choice="choice",shape="long",
                          alt.var="mode",chid.var="individual")
TravelMode$avinc <- with(TravelMode,(mode=='air')*income)
nl.TM <- mlogit(choice ~ wait + gcost + avinc, TravelMode, reflevel = "car", 
                nests = list(fly = "air", ground = c("train", "bus", "car")), 
                unscaled=TRUE)
summary(nl.TM)

## ------------------------------------------------------------------------
data("HC", package = "mlogit")
HC <- mlogit.data(HC, varying = c(2:8, 10:16), choice = "depvar", shape = "wide")
head(HC)

## ------------------------------------------------------------------------
cooling.modes <- HC$alt %in% c("gcc", "ecc", "erc","hpc")
HC$icca[!cooling.modes] <- HC$occa[!cooling.modes] <- 0

## ------------------------------------------------------------------------
ml.HC <- mlogit(depvar~occa+icca+och+ich, HC)
nl.HC <- mlogit(depvar~occa+icca+och+ich, HC, 
                nests = list(cooling = c('ecc', 'erc', 'gcc', 'hpc'), 
                  noncool = c('ec', 'gc', 'er')))
summary(nl.HC)

## ------------------------------------------------------------------------
nl.HC.u <- update(nl.HC, un.nest.el = TRUE)

## ------------------------------------------------------------------------
pcl <- mlogit(choice~freq+cost+ivt+ovt, Bhat, reflevel='car',
              nests='pcl', constPar=c('iv.train.air'))
summary(pcl)

## ------------------------------------------------------------------------
data("Train", package = "mlogit")
Tr <- mlogit.data(Train, shape = "wide", varying = 4:11, 
                  choice = "choice", sep = "_", 
                  opposite = c("price", "time", "change", "comfort"),
                  alt.levels=c("A", "B"), id.var ="id")

## ----echo = TRUE---------------------------------------------------------
Train.ml <- mlogit(choice ~ price + time + change + comfort, Tr)
Train.mxlc <- mlogit(choice ~ price + time + change + comfort, Tr,
               panel = TRUE, rpar = c(time = "cn", change = "n", comfort = "ln"),
               correlation = TRUE, R = 100, halton = NA)
Train.mxlu <- update(Train.mxlc, correlation = FALSE)

## ------------------------------------------------------------------------
time.value <- rpar(Train.mxlc, "time", norm = "price")
summary(time.value)
med(time.value)
mean(time.value)
stdev(time.value)

## ------------------------------------------------------------------------
cor.mlogit(Train.mxlc)
cov.mlogit(Train.mxlc)
stdev(Train.mxlc)

## ------------------------------------------------------------------------
data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, shape="wide", varying=2:9, choice="mode")
Fish.mprobit <- mlogit(mode~price | income | catch, Fish, probit = TRUE, alt.subset=c('beach', 'boat','pier'))

## ------------------------------------------------------------------------
summary(Fish.mprobit)

## ------------------------------------------------------------------------
ml.Fish <- mlogit(mode~price | income | catch, Fishing, shape = "wide", varying = 2:9)

## ------------------------------------------------------------------------
ml.Fish.c <- update(ml.Fish, . ~ . | . - income | .)

## ------------------------------------------------------------------------
waldtest(ml.Fish, ml.Fish.c)
lrtest(ml.Fish, ml.Fish.c)
scoretest(ml.Fish.c, ml.Fish)

## ----eval = FALSE--------------------------------------------------------
## lrtest(ml.Fish, . ~ . | . - income | .)
## lrtest(ml.Fish, mode ~ price | 1 | catch)
## lrtest(ml.Fish.c, . ~ . | . + income | .)
## lrtest(ml.Fish.c, mode ~ price | income | catch)
## waldtest(ml.Fish, . ~ . | . - income | .)
## waldtest(ml.Fish, mode ~ price | 1 | catch)
## waldtest(ml.Fish.c, . ~ . | . + income | .)
## waldtest(ml.Fish.c, mode ~ price | income | catch)
## scoretest(ml.Fish.c, . ~ . | . + income | .)
## scoretest(ml.Fish.c, mode ~ price | income | catch)

## ------------------------------------------------------------------------
lrtest(hl.MC, ml.MC)
waldtest(hl.MC, heterosc = FALSE)

## ----results = 'hide'----------------------------------------------------
lrtest(hl.MC)
waldtest(hl.MC)

## ------------------------------------------------------------------------
library("car")
linearHypothesis(hl.MC, c('sp.air=1', 'sp.train=1'))

## ------------------------------------------------------------------------
scoretest(ml.MC, heterosc = TRUE)

## ------------------------------------------------------------------------
c(wald = waldtest(hl.TM)$statistic, 
  lr = lrtest(hl.TM)$Chisq[2],
  score = scoretest(ml.TM, heterosc = TRUE)$statistic)

## ------------------------------------------------------------------------
lrtest(nl.HC)
waldtest(nl.HC)
scoretest(ml.HC, nests = list(cooling = c('ecc', 'erc', 'gcc', 'hpc'), 
                   noncool = c('ec', 'gc', 'er')))

## ------------------------------------------------------------------------
linearHypothesis(nl.HC, c("iv:cooling = 1", "iv:noncool = 1"))

## ------------------------------------------------------------------------
lrtest(nl.HC,nl.HC.u)
waldtest(nl.HC, un.nest.el = TRUE)
scoretest(nl.HC.u, un.nest.el = FALSE)
linearHypothesis(nl.HC, "iv:cooling = iv:noncool")

## ------------------------------------------------------------------------
lrtest(Train.mxlu, Train.ml)
waldtest(Train.mxlu)
scoretest(Train.ml, rpar = c(time = "n", change = "n", comfort = "n"), R = 100,     
          correlation = FALSE, halton = NA, panel = TRUE)

## ------------------------------------------------------------------------
lrtest(Train.mxlc, Train.ml)
waldtest(Train.mxlc)
scoretest(Train.ml, rpar = c(time = "n", change = "n", comfort = "n"), R = 100,     
          correlation = TRUE, halton = NA, panel = TRUE)

## ------------------------------------------------------------------------
lrtest(Train.mxlc, Train.mxlu)
waldtest(Train.mxlc, correlation = FALSE)
scoretest(Train.mxlu, correlation = TRUE)

