## ---- echo = FALSE-------------------------------------------------------
concreteFrame <- read.csv("concreteData.csv")

## ---- echo = TRUE--------------------------------------------------------
str(concreteFrame)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  myDRProject <- SetupProject(concreteFrame, "ConcreteProject")
#  SetTarget(myDRProject, target="strength")

## ---- echo = FALSE, warnings = FALSE, message = FALSE--------------------
library(datarobot)
concreteModels <- readRDS("concreteModels.rds")
fullFrame <- as.data.frame(concreteModels, simple = FALSE)
modelsFrame <- as.data.frame(concreteModels)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  WaitForAutopilot(myDRproject)
#  concreteModels <- ListModels(myDRProject)

## ---- echo = TRUE--------------------------------------------------------
summary(concreteModels)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 1: Validation set performance for the 15 poorer-performing predictive models."----
poorCol <- c("black", "red", rep("black", 13))
plot(concreteModels, orderDecreasing = TRUE, selectRecords = seq(16, 30, 1),
     textColor = poorCol, xpos = 10, xlim = c(0, 18))
abline(v = min(modelsFrame$validationMetric), lty = 2, lwd = 2, col = "magenta")

## ---- echo = TRUE--------------------------------------------------------
ridgeRows <- grep("Ridge", modelsFrame$modelType)
modelsFrame[ridgeRows, c("expandedModel", "validationMetric")]

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 2: Validation set performance for the 15 better-performing predictive models."----
goodCol <- c(rep("black", 3), "red", rep("black", 6), "red", rep("black", 3), "red")
plot(concreteModels, orderDecreasing = TRUE, selectRecords = seq(1, 15, 1),
     textColor = goodCol, xlim = c(0, 18), xpos = 10)
abline(v = min(modelsFrame$validationMetric), lty = 2, lwd = 2, col = "magenta")

## ---- echo = TRUE--------------------------------------------------------
FullAverageDataset <- function(covarFrame, refCovar, numGrid, plotRange = NULL) {
  covars <- colnames(covarFrame)
  refIndex <- which(covars == refCovar)
  refVar <- covarFrame[, refIndex]
  if (is.null(plotRange)) {
    start <- min(refVar)
    end <- max(refVar)
  } else {
    start <- plotRange[1]
    end <- plotRange[2]
  }
  grid <- seq(start, end, length = numGrid)
  outFrame <- covarFrame
  outFrame[, refIndex] <- grid[1]
  for (i in 2:numGrid) {
    upFrame <- covarFrame
    upFrame[, refIndex] <- grid[i]
    outFrame <- rbind.data.frame(outFrame, upFrame)
  }
  outFrame
}

## ---- echo = TRUE--------------------------------------------------------
PDPbuilder <- function(covarFrame, refCovar, listOfModels,
                       numGrid = 100, plotRange = NULL) {
  augmentedFrame <- FullAverageDataset(covarFrame, refCovar,
                                       numGrid, plotRange)
  nModels <- length(listOfModels)
  library(doBy)
  model <- listOfModels[[1]]
  dataset <- UploadPredictionDataset(model$projectId, augmentedFrame)
  predictJobId <- RequestPredictionsForDataset(model$projectId, model$modelId, dataset$id)
  projectId <- model$projectId
  yHat <- GetPredictions(projectId, predictJobId)
  hatFrame <- augmentedFrame
  hatFrame$prediction <- yHat
  hatSum <- summaryBy(list(c("prediction"), c(refCovar)), data = hatFrame, FUN = mean)
  colnames(hatSum)[2] <- model$modelType

  for (i in 2:nModels) {
    model <- listOfModels[[i]]
    dataset <- UploadPredictionDataset(model$projectId, augmentedFrame)
    predictJobId <- RequestPredictionsForDataset(model$projectId, model$modelId, dataset$id)
    projectId <- model$projectId
    yHat <- GetPredictions(projectId, predictJobId)
    hatFrame <- augmentedFrame
    hatFrame$prediction <- yHat
    upSum <- summaryBy(list(c("prediction"), c(refCovar)), data = hatFrame, FUN = mean)
    colnames(upSum)[2] <- model$modelType
    hatSum <- merge(hatSum, upSum)
  }
  return(hatSum)
}

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  modelList <- list(concreteModels[[1]], concreteModels[[5]],
#                    concreteModels[[12]], concreteModels[[29]])
#  agePDPframe <- PDPbuilder(concreteFrame[, 1:8], "age", modelList)

## ---- echo = TRUE--------------------------------------------------------
PDPlot <- function(PDframe, Response, ltypes,
                   lColors, ...) {
  Rng <- range(Response)
  nModels <- ncol(PDframe) - 1
  modelNames <- colnames(PDframe)[2: (nModels + 1)]
  plot(PDframe[, 1], PDframe[, 2], ylim=Rng, type = "l",
       lty = ltypes[1], lwd = 2, col = lColors[1],
       xlab = colnames(PDframe)[1],
       ylab = "Partial Dependence", ...)
  abline(h = Rng, lty=3, lwd=2, col="black")
  for (i in 2:nModels) {
    lines(PDframe[, 1], PDframe[, i + 1], lwd = 2,
          lty = ltypes[i], col = lColors[i])
  }
  legend("topleft", lty = ltypes, text.col = lColors,
         col = lColors, lwd = 2, legend = modelNames)
}

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 3: Overlaid age partial dependence plots for four models."----
par(mfrow=c(1, 1))
agePDPframe <- readRDS("agePDPframe.rds")
Response <- concreteFrame$strength
ltypes <- seq(4)
lColors <- c("limegreen", "black", "blue", "magenta")
PDPlot(agePDPframe, Response, ltypes, lColors)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 4: Overlaid cement partial dependence plots for four models."----
par(mfrow=c(1, 1))
cementPDPframe <- readRDS("cementPDPframe.rds")
PDPlot(cementPDPframe, Response, ltypes, lColors)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 5: Overlaid water partial dependence plots for four models."----
par(mfrow=c(1, 1))
waterPDPframe <- readRDS("waterPDPframe.rds")
PDPlot(waterPDPframe, Response, ltypes, lColors)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 6: Overlaid blastFurnaceSlag partial dependence plots for four models."----
par(mfrow=c(1, 1))
blastPDPframe <- readRDS("blastPDPframe.rds")
PDPlot(blastPDPframe, Response, ltypes, lColors)

