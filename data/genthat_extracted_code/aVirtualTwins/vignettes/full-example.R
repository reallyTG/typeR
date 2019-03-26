## ---- collapse=T, eval = F-----------------------------------------------
#  vt.data <- function(dataset, outcome.field, treatment.field, interactions = TRUE, ...){
#    data <- formatRCTDataset(dataset, outcome.field, treatment.field, interactions = TRUE)
#    VT.object(data = data, ...)
#  }

## ---- collapse=T---------------------------------------------------------
# load library VT
library(aVirtualTwins)
# load data sepsis
data(sepsis)
# initialize VT.object
vt.o <- vt.data(sepsis, "survival", "THERAPY", TRUE)

## ---- collapse=T---------------------------------------------------------
# Creation of categorical variable
cat.x <- rep(1:5, (nrow(sepsis))/5)
cat.x <- as.factor(cat.x)
sepsis.tmp <- cbind(sepsis, cat.x)
vt.o.tmp <- vt.data(sepsis.tmp, "survival", "THERAPY", TRUE)

## ---- collapse=T, echo = FALSE-------------------------------------------
rm(vt.o.tmp, cat.x, sepsis.tmp)

## ---- collapse=T---------------------------------------------------------
# use randomForest::randomForest()
library(randomForest, verbose = F)
# Reproducibility
set.seed(123)
# Fit rf model 
# default params
# set interactions to TRUE if using interaction between T and X
model.rf <- randomForest(x = vt.o$getX(interactions = T),
                         y = vt.o$getY(),
                         ntree = 500)
# initialize VT.forest.one
vt.f.rf <- vt.forest("one", vt.data = vt.o, model = model.rf, interactions = T)
### or you can use randomForest inside vt.forest()
vt.f.rf <- vt.forest("one", vt.data = vt.o, interactions = T, ntree = 500)

## ---- collapse=T---------------------------------------------------------
# # use randomForest::randomForest()
# library(party, verbose = F)
# # Reproducibility
# set.seed(123)
# # Fit cforest model 
# # default params
# # set interactions to TRUE if using interaction between T and X
# model.cf <- cforest(formula = vt.o$getFormula(), data = vt.o$getData(interactions = T))
# # initialize VT.forest.one
# vt.f.cf <- vt.forest("one", vt.data = vt.o, model = model.cf)

## ---- collapse=T---------------------------------------------------------
# Copy new object
vt.o.tr <- vt.o$copy()
# Change levels
tmp <- ifelse(vt.o.tr$data$survival == 1, "y", "n")
vt.o.tr$data$survival <- as.factor(tmp)
rm(tmp)
# Check new data to be sure
formatRCTDataset(vt.o.tr$data, "survival", "THERAPY")
# use caret::train()
library(caret, verbose = F)
# Reproducibility
set.seed(123)
# fit train model
fitControl <- trainControl(classProbs = T, method = "none")
model.tr <- train(x = vt.o.tr$getX(interactions = T),
                  y = vt.o.tr$getY(),
                  method = "rf",
                  tuneGrid = data.frame(mtry = 5),
                  trControl = fitControl)
# initialize VT.forest.one
vt.f.tr <- vt.forest("one", vt.o.tr, model = model.tr)

## ---- collapse=T---------------------------------------------------------
# grow RF for T = 1
model.rf.trt1 <- randomForest(x = vt.o$getX(trt = 1),
                              y = vt.o$getY(trt = 1))
# grow RF for T = 0
model.rf.trt0 <- randomForest(x = vt.o$getX(trt = 0),
                              y = vt.o$getY(trt = 0))
# initialize VT.forest.double()
vt.doublef.rf <- vt.forest("double",
                           vt.data = vt.o, 
                           model_trt1 = model.rf.trt1, 
                           model_trt0 = model.rf.trt0)
### Or you can use randomForest() inside
vt.doublef.rf <- vt.forest("double",
                           vt.data = vt.o,
                           ntree = 200)

## ---- collapse=T, cache=F------------------------------------------------

# initialize k-fold RF
# you can use randomForest options
model.fold <- vt.forest("fold", vt.data = vt.o, fold = 5, ratio = 1, interactions = T, ntree = 200)

## ---- collapse=T---------------------------------------------------------
# you get twin1 and twin2 by your own method
# here, i'll use random number between 0 and 1 :
twin1_random <- runif(470)
twin2_random <- runif(470)

# then you can initialize VT.difft class : 
model.difft <- VT.difft(vt.o, twin1 = twin1_random, twin2 = twin2_random, "absolute")
# compute difference of twins : 
model.difft$computeDifft()
# See results
head(model.difft$difft)
# Graph :
# hist(model.difft$difft)

## ---- collapse=T---------------------------------------------------------
# initialize classification tree
tr.class <- vt.tree("class",
                    vt.difft = vt.f.rf,
                    sens = ">",
                    threshold = quantile(vt.f.rf$difft, seq(.5, .8, .1)),
                    maxdepth = 3,
                    cp = 0,
                    maxcompete = 2) 
# tr.class is a list if threshold is a vectoor
class(tr.class)
# acce trees with treeXX
class(tr.class$tree1)

## ---- collapse=T---------------------------------------------------------
# initialize regression tree
tr.reg <- vt.tree("reg",
                  vt.difft = vt.f.rf,
                  sens = ">",
                  threshold = quantile(vt.f.rf$difft, seq(.5, .8, .1)))
# tr.class is a list if threshold is a vectoor
class(tr.reg)
# access trees with treeXX
class(tr.reg$tree1)

## ---- collapse=T---------------------------------------------------------
# use tr.class computed previously
vt.sbgrps <- vt.subgroups(tr.class)
# print tables with knitr package
library(knitr)
knitr::kable(vt.sbgrps)

## ---- collapse=T, echo=F, fig.align='center', fig.height=4, fig.width=6----
library(rpart.plot)
rpart.plot(tr.class$tree2$tree, type = 1, extra = 1)

## ---- collapse=T---------------------------------------------------------
tr.class$tree2$createCompetitors()
head(tr.class$tree2$competitors)

## ---- collapse=T---------------------------------------------------------
vt.o$getIncidences("PRAPACHE >= 26 & AGE >= 52")
# or
# tr.class$tree2$getIncidences("PRAPACHE >= 26 & AGE >= 52")

## ---- collapse=T---------------------------------------------------------
tr.class$tree2$getInfos()
# access Ahat
# tr.class$tree2$Ahat

## ---- collapse=T---------------------------------------------------------
tr.class$tree2$run(maxdepth = 2)

