## ---- echo = FALSE-------------------------------------------------------
set.seed(1)

## ---- message = FALSE----------------------------------------------------
library(exprso)
library(magrittr)
data(iris)
array <- exprso(iris[1:100, 1:4], iris[1:100, 5])

## ---- results = "hide"---------------------------------------------------
splitSets <- array %>%
  modTransform %>% modNormalize %>%
  splitSample(percent.include = 67)

## ---- results = "hide", message = FALSE----------------------------------
pred <- trainingSet(splitSets) %>%
  fsStats(how = "t.test") %>%
  fsPrcomp(top = 2) %T>%
  plot(c = 0) %>%
  buildSVM %>%
  predict(testSet(splitSets)) %T>%
  calcStats

## ---- results = "hide", eval = FALSE-------------------------------------
#  ss <- ctrlSplitSet(func = "splitSample", percent.include = 67, replace = TRUE)
#  fs <- ctrlFeatureSelect(func = "fsPathClassRFE", top = 0)
#  gs <- ctrlGridSearch(func = "plGrid", top = 0, how = "buildLDA")
#  
#  pred <- trainingSet(splitSets) %>%
#    plMonteCarlo(B = 10, ctrlSS = ss, ctrlFS = fs, ctrlGS = gs) %>%
#    pipeUnboot %>%
#    pipeFilter(colBy = "valid.auc", top = 3) %>%
#    buildEnsemble %>%
#    predict(testSet(splitSets)) %T>%
#    calcStats

## ---- results = "hide"---------------------------------------------------
pred <- trainingSet(splitSets) %>%
  modCluster(top = 0, how = "hclust", k = 4) %>%
  modSubset(colBy = "cluster", include = 1)

## ---- results = "hide"---------------------------------------------------
clusteredCases <- trainingSet(splitSets) %>%
  modSubset(colBy = "defineCase", include = "Case") %>%
  modCluster %>%
  modSubset(colBy = "cluster", include = 1) %>%
  conjoin(trainingSet(splitSets) %>%
            modSubset(colBy = "defineCase", include = "Control"))

## ---- eval = FALSE-------------------------------------------------------
#  data.gse <- GEOquery::getGEO("GSE5847", GSEMatrix = FALSE)
#  data.eset <- GSE2eSet(data.gse)
#  data.eset@phenoData@data

## ---- eval = FALSE-------------------------------------------------------
#  pred <- trainingSet(splitSets) %>%
#    buildDNN(top = 0,
#             activation = "TanhWithDropout", # or 'Tanh'
#             input_dropout_ratio = 0.2, # % of inputs dropout
#             hidden_dropout_ratios = c(0.5,0.5,0.5), # % for nodes dropout
#             balance_classes = TRUE,
#             hidden = c(50,50,50), # three layers of 50 nodes
#             epochs = 100) %>%
#    predict(testSet(splitSets)) %T>%
#    calcStats

## ---- eval = FALSE-------------------------------------------------------
#  h2o::h2o.shutdown() # frees up RAM for more learning

## ---- eval = FALSE-------------------------------------------------------
#  pl <- trainingSet(splitSets) %>%
#    plGrid(array.valid = testSet(splitSets), top = 0,
#           how = "buildDNN", fold = NULL,
#           activation = "TanhWithDropout", # or 'Tanh'
#           input_dropout_ratio = 0.2, # % of inputs dropout
#           hidden_dropout_ratios = list(c(0.5,0.5,0.5)), # % for nodes dropout
#           balance_classes = TRUE,
#           hidden = list(c(50,50,50)), # three layers of 50 nodes
#           epochs = 100)

## ---- eval = FALSE-------------------------------------------------------
#  pl <- trainingSet(splitSets) %>%
#    plGrid(array.valid = testSet(splitSets), top = 0,
#           how = "buildDNN", fold = NULL,
#           activation = c("Rectifier",
#                          "TanhWithDropout"), # or 'Tanh'
#           input_dropout_ratio = c(0.2,
#                                   0.5,
#                                   0.8), # % of inputs dropout
#           hidden_dropout_ratios = list(c(0.5,0.5,0.5),
#                                        c(0.2,0.2,0.2)), # % for nodes dropout
#           balance_classes = TRUE,
#           hidden = list(c(50,50,50),
#                         c(100,100,100),
#                         c(200,200,200)), # three layers of 50 nodes
#           epochs = c(100))

## ---- results = "hide"---------------------------------------------------
fs.inner <- ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test")
gs.inner <- ctrlGridSearch(func = "plGrid", top = 3,
                           how = "buildSVM", fold = NULL)

fs.outer <- ctrlFeatureSelect(func = "fsNULL", top = 0)
gs.outer <- ctrlGridSearch(func = "plNested", fold = 2,
                           ctrlFS = fs.inner, ctrlGS = gs.inner)

pl <- array %>%
  modTransform %>% modNormalize %>%
  plNested(fold = 2, ctrlFS = fs.outer, ctrlGS = gs.outer)

## ---- results = "hide"---------------------------------------------------
fs.inner <- ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test")
gs.inner <- ctrlGridSearch(func = "plGrid", top = c(2, 3, 4),
                           how = "buildSVM", fold = NULL)

ss.outer <- ctrlSplitSet(func = "splitStratify", percent.include = 67)
fs.outer <- ctrlFeatureSelect(func = "fsNULL", top = 0)
gs.outer <- ctrlGridSearch(func = "plNested", fold = 10,
                           ctrlFS = fs.inner, ctrlGS = gs.inner)

pl <- array %>%
  modTransform %>% modNormalize %>%
  plMonteCarlo(B = 5, ctrlSS = ss.outer, ctrlFS = fs.outer, ctrlGS = gs.outer)

## ---- results = "hide"---------------------------------------------------
top <-
  pipeFilter(pl, colBy = c("valid.sens", "valid.sens", "valid.spec"), top = 1)

## ---- results = "hide"---------------------------------------------------
splitSets <- data(arrayMulti) %>% get %>%
  splitStratify(percent.include = 67, colBy = "sex")

trainingSet(splitSets) %>%
  fsANOVA %>%
  buildNB %>% # any build method can become multi with 1-vs-all
  predict(testSet(splitSets)) %T>%
  calcStats

## ---- results = "hide"---------------------------------------------------
fs <- ctrlFeatureSelect(func = "fsANOVA", top = 0)
gs <- ctrlGridSearch(func = "plGrid", top = 0, how = "buildRF", fold = 2)

pl <- trainingSet(splitSets) %>%
  plNested(fold = 2, ctrlFS = fs, ctrlGS = gs) %T>%
  calcNested(colBy = "valid.acc")

## ---- results = "hide"---------------------------------------------------
pl %>% buildEnsemble %>%
  predict(testSet(splitSets)) %>%
  calcStats

## ---- results = "hide", message = FALSE----------------------------------
fs <- ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test")

pl <- plGridMulti(trainingSet(splitSets), testSet(splitSets),
                  ctrlFS = fs, top = c(2, 3),
                  how = "buildSVM", kernel = c("linear", "radial"),
                  gamma = c(.1, .2))

## ---- results = "hide", eval = FALSE-------------------------------------
#  fs.inner <- ctrlFeatureSelect(func = "fsStats", top = 0, how = "t.test")
#  fs.outer <- ctrlFeatureSelect(func = "fsNULL", top = 0)
#  gs.outer <-
#    ctrlGridSearch(func = "plGridMulti", ctrlFS = fs.inner, top = c(2, 3),
#                   how = "buildSVM", kernel = c("linear", "radial"), gamma = c(.1, .2))
#  
#  pl <- plNested(trainingSet(splitSets), fold = 2,
#                 ctrlFS = fs.outer, ctrlGS = gs.outer)

