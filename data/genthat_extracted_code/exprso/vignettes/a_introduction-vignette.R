## ---- eval = FALSE-------------------------------------------------------
#  install.packages("exprso")
#  library(exprso)

## ---- echo = FALSE, message = FALSE--------------------------------------
library(exprso)
set.seed(1)

## ---- echo = FALSE, out.width = '675pt', fig.retina = NULL---------------
knitr::include_graphics("exprso-diagram.jpg")

## ------------------------------------------------------------------------
data(iris)
array <- exprso(iris[1:80, 1:4], iris[1:80, 5])

## ------------------------------------------------------------------------
sub <- array[array$defineCase == "Case", ]
sub <- modSubset(array, colBy = "defineCase", include = "Case")
sub <- subset(array, subset = array$defineCase == "Case")

## ------------------------------------------------------------------------
arrays <-
  splitStratify(array,
                percent.include = 67,
                colBy = NULL)

array.train <- arrays[[1]]

## ------------------------------------------------------------------------
balance <-
  splitStratify(arrays[[2]],
                percent.include = 100,
                colBy = NULL)

array.test <- balance[[1]]

## ------------------------------------------------------------------------
array.train <-
  fsStats(array.train, top = 0, how = "t.test")

## ------------------------------------------------------------------------
array.train <-
  fsPrcomp(array.train, top = 50)

## ---- results = "hide", message = FALSE----------------------------------
plot(array.train)

## ------------------------------------------------------------------------
mach <-
  buildANN(array.train, top = 10, size = 5)

## ------------------------------------------------------------------------
pred <-
  predict(mach, array.test)

## ------------------------------------------------------------------------
calcStats(pred)

## ---- results = "hide", warning = FALSE, message = FALSE-----------------
gs <-
  plGrid(array.train = array.train,
         array.valid = array.test,
         top = c(2, 4),
         how = "buildSVM",
         fold = 0,
         kernel = "linear",
         cost = 10^(-3:3)
)

## ------------------------------------------------------------------------
sub <- gs[gs$cost == 1, ]
sub <- pipeSubset(gs, colBy = "cost", include = 1)
sub <- subset(gs, subset = gs$cost == 1)

## ------------------------------------------------------------------------
ss <-
  ctrlSplitSet(func = "splitSample", percent.include = 67, replace = TRUE)
fs <-
  ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test")
gs <-
  ctrlGridSearch(func = "plGrid",
                 how = "buildSVM",
                 top = c(2, 4),
                 kernel = "linear",
                 cost = 10^(-3:3),
                 fold = 10)

## ---- results = "hide", warning = FALSE----------------------------------
boot <-
  plMonteCarlo(arrays[[1]],
               B = 5,
               ctrlSS = ss,
               ctrlFS = fs,
               ctrlGS = gs)

## ------------------------------------------------------------------------
calcMonteCarlo(boot, colBy = "valid.auc")

## ---- results = "hide"---------------------------------------------------
ens <- buildEnsemble(boot, top = 1, colBy = "valid.auc")
pred <- predict(ens, array.test, how = "majority")

## ---- echo = FALSE-------------------------------------------------------
calcStats(pred)

