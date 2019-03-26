library(intubate)


### Name: caret
### Title: Interfaces for caret package for data science pipelines.
### Aliases: ntbt_avNNet ntbt_bagEarth ntbt_bagFDA ntbt_calibration
###   ntbt_dummyVars ntbt_icr ntbt_knn3 ntbt_lift ntbt_pcaNNet ntbt_sbf
###   ntbt_train
### Keywords: intubate magrittr caret avNNet bagEarth bagFDA calibration
###   dummyVars icr knn3 lift pcaNNet sbf train

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(caret)
##D 
##D 
##D ## ntbt_avNNet: Neural Networks Using Model Averaging
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D data(BloodBrain)
##D BB <- list(bbbDescr, logBBB)
##D 
##D ## Original function to interface
##D avNNet(bbbDescr, logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_avNNet(BB, bbbDescr, logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D ## so it can be used easily in a pipeline.
##D BB %>%
##D   ntbt_avNNet(bbbDescr, logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D 
##D ## ntbt_bagEarth: Bagged Earth
##D 
##D ## Original function to interface
##D bagEarth(Volume ~ ., data = trees)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bagEarth(trees, Volume ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D trees %>%
##D   ntbt_bagEarth(Volume ~ .)
##D 
##D 
##D ## ntbt_bagFDA: Bagged FDA
##D library(mlbench)
##D library(earth)
##D data(Glass)
##D 
##D set.seed(36)
##D inTrain <- sample(1:dim(Glass)[1], 150)
##D 
##D trainData <- Glass[ inTrain, ]
##D testData  <- Glass[-inTrain, ]
##D ## Original function to interface
##D ## bagFDA(Type ~ ., trainData)   ## There is an error:
##D ## Error in requireNamespaceQuietStop("mda") : package mda is required
##D ##                               ## even when mda is installed
##D ## For now all of this stays commented.
##D 
##D ## The interface puts data as first parameter
##D ## ntbt_bagFDA(trainData, Type ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D ## trainData %>%
##D ##   ntbt_bagFDA(Type ~ .)
##D 
##D 
##D ## ntbt_calibration: Probability Calibration Plot
##D data(mdrr)
##D mdrrDescr <- mdrrDescr[, -nearZeroVar(mdrrDescr)]
##D mdrrDescr <- mdrrDescr[, -findCorrelation(cor(mdrrDescr), .5)]
##D inTrain <- createDataPartition(mdrrClass)
##D trainX <- mdrrDescr[inTrain[[1]], ]
##D trainY <- mdrrClass[inTrain[[1]]]
##D testX <- mdrrDescr[-inTrain[[1]], ]
##D testY <- mdrrClass[-inTrain[[1]]]
##D library(MASS)
##D ldaFit <- lda(trainX, trainY)
##D qdaFit <- qda(trainX, trainY)
##D testProbs <- data.frame(obs = testY,
##D lda <- predict(ldaFit, testX)$posterior[,1],
##D qda <- predict(qdaFit, testX)$posterior[,1])
##D 
##D ## Original function to interface
##D calPlotData <- calibration(obs ~ lda + qda, data = testProbs)
##D xyplot(calPlotData, auto.key = list(columns = 2))
##D 
##D ## The interface puts data as first parameter
##D calPlotData <- ntbt_calibration(testProbs, obs ~ lda + qda)
##D xyplot(calPlotData, auto.key = list(columns = 2))
##D 
##D ## so it can be used easily in a pipeline.
##D testProbs %>%
##D   ntbt_calibration(obs ~ lda + qda) %>%
##D   xyplot(auto.key = list(columns = 2))
##D 
##D 
##D ## ntbt_dummyVars
##D when <- data.frame(time = c("afternoon", "night", "afternoon",
##D                             "morning", "morning", "morning",
##D                             "morning", "afternoon", "afternoon"),
##D                    day = c("Mon", "Mon", "Mon",
##D                            "Wed", "Wed", "Fri",
##D                            "Sat", "Sat", "Fri"))
##D 
##D levels(when$time) <- list(morning="morning",
##D                           afternoon="afternoon",
##D                           night="night")
##D levels(when$day) <- list(Mon="Mon", Tue="Tue", Wed="Wed", Thu="Thu",
##D                          Fri="Fri", Sat="Sat", Sun="Sun")
##D 
##D ## Original function to interface
##D mainEffects <- dummyVars(~ day + time, data = when)
##D mainEffects
##D predict(mainEffects, when[1:3,])
##D 
##D ## The interface puts data as first parameter
##D mainEffects <- ntbt_dummyVars(when, ~ day + time)
##D mainEffects
##D predict(mainEffects, when[1:3,])
##D 
##D ## so it can be used easily in a pipeline.
##D when %>%
##D   ntbt_dummyVars(~ day + time) %>%
##D   predict(when[1:3,])
##D 
##D 
##D ## ntbt_icr: Independent Component Regression
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D data(BloodBrain)
##D BB <- list(bbbDescr, logBBB)
##D 
##D ## Original function to interface
##D icr(bbbDescr, logBBB, n.comp = 5)
##D 
##D ## The interface puts data as first parameter
##D ntbt_icr(BB, bbbDescr, logBBB, n.comp = 5)
##D 
##D ## so it can be used easily in a pipeline.
##D BB %>%
##D   ntbt_icr(bbbDescr, logBBB, n.comp = 5)
##D 
##D 
##D ## ntbt_knn3: k-Nearest Neighbour Classification
##D ## Original function to interface
##D knn3(Species ~ ., iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_knn3(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_knn3(Species ~ .)
##D 
##D 
##D ## ntbt_lift: Lift Plot
##D set.seed(1)
##D simulated <- data.frame(obs = factor(rep(letters[1:2], each = 100)),
##D perfect = sort(runif(200), decreasing = TRUE),
##D random = runif(200))
##D ## Original function to interface
##D lift1 <- lift(obs ~ random, data = simulated)
##D lift1
##D xyplot(lift1)
##D 
##D ## The interface puts data as first parameter
##D lift1 <- ntbt_lift(simulated, obs ~ random)
##D lift1
##D xyplot(lift1)
##D 
##D ## so it can be used easily in a pipeline.
##D simulated %>%
##D   ntbt_lift(obs ~ random) %>%
##D   xyplot()
##D 
##D 
##D ## ntbt_pcaNNet: Neural Networks with a Principal Component Step
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D data(BloodBrain)
##D BB <- list(bbbDescr, logBBB)
##D 
##D ## Original function to interface
##D pcaNNet(bbbDescr[, 1:10], logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_pcaNNet(BB, bbbDescr[, 1:10], logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D ## so it can be used easily in a pipeline.
##D BB %>%
##D   ntbt_pcaNNet(bbbDescr[, 1:10], logBBB, size = 5, linout = TRUE, trace = FALSE)
##D 
##D 
##D ## ntbt_sbf: Selection By Filtering (SBF)
##D ## Not found example using formula interface, and I am
##D ## completely ignorant to construct one.
##D data(BloodBrain)
##D BB <- list(bbbDescr, logBBB)
##D 
##D ## Be prepared to wait...
##D ## Original function to interface
##D sbf(bbbDescr, logBBB,
##D     sbfControl = sbfControl(functions = rfSBF,
##D                             verbose = FALSE, 
##D                             method = "cv"))
##D 
##D ## The interface puts data as first parameter
##D ntbt_sbf(BB, bbbDescr, logBBB,
##D          sbfControl = sbfControl(functions = rfSBF,
##D                                  verbose = FALSE, 
##D                                  method = "cv"))
##D 
##D ## so it can be used easily in a pipeline.
##D BB %>%
##D   ntbt_sbf(bbbDescr, logBBB,
##D            sbfControl = sbfControl(functions = rfSBF,
##D                                    verbose = FALSE, 
##D                                    method = "cv"))
##D 
##D 
##D ## ntbt_train: Fit Predictive Models over Different Tuning Parameters
##D library(mlbench)
##D data(BostonHousing)
##D 
##D ## Original function to interface
##D train(medv ~ . + rm:lstat, data = BostonHousing, method = "lm")
##D 
##D ## The interface puts data as first parameter
##D ntbt_train(BostonHousing, medv ~ . + rm:lstat, method = "lm")
##D 
##D ## so it can be used easily in a pipeline.
##D BostonHousing %>%
##D   ntbt_train(medv ~ . + rm:lstat, method = "lm")
## End(Not run)



