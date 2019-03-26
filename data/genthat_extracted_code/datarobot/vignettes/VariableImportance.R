## ---- echo = TRUE, eval = FALSE------------------------------------------
#  originalProject <- SetupProject("Friedman1.csv", "OriginalProject")
#  SetTarget(originalProject, target = "Y")
#  WaitForAutopilot(originalProject, verbosity = 0)
#  originalModels <- ListModels(originalProject)

## ---- echo = TRUE--------------------------------------------------------
PermuteColumn <- function(originalFile, colName, permutedFile, iseed = 317) {
  set.seed(iseed)
  dframe <- read.csv(originalFile)
  varNames <- colnames(dframe)
  colIndex <- which(varNames == colName)
  x <- dframe[ ,colIndex]
  y <- sample(x)
  outFrame <- dframe
  outFrame[ ,colIndex] <- y
  write.csv(outFrame, permutedFile, row.names=FALSE)
}

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  modelList <- list(n = 11)
#  modelList[[1]] <- originalModels
#  permFile <- tempfile(fileext = "permFile.csv")
#  for (i in 1:10) {
#    varName <- paste("X",i,sep="")
#    PermuteColumn("Friedman1.csv", varName, permFile)
#    projName <- paste("PermProject", varName, sep = "")
#    permProject <- SetupProject(permFile, projectName = projName)
#    SetTarget(permProject, target = "Y")
#    WaitForAutopilot(permProject, verbosity = 0)
#    modelList[[i+1]] <- ListModels(permProject)
#  }

## ---- echo = FALSE, warning=FALSE, message=FALSE-------------------------
library(datarobot)
modelList <- readRDS("PermutationModelList.rds")

## ---- echo = TRUE--------------------------------------------------------
PermutationMerge <- function(compositeList, matchPct = NULL, metricNames, matchMetric = NULL) {
  df <- as.data.frame(compositeList[[1]], simple = FALSE)
  if (is.null(matchPct)) {
    index <- seq(1, nrow(df), 1)
  } else {
      index <- which(round(df$samplePct) == matchPct)
  }
  if (is.null(matchMetric)) {
    projectMetric <- compositeList[[1]][[1]]$projectMetric
    matchMetric <- paste(projectMetric, "validation", sep = ".")
  }
  getCols <- c("modelType", "expandedModel", "samplePct", "blueprintId", matchMetric)
  outFrame <- df[index, getCols]
  keepCols <- getCols
  keepCols[5] <- metricNames[1]
  colnames(outFrame) <- keepCols
  n <- length(compositeList)
  for (i in 2:n) {
    df <- as.data.frame(compositeList[[i]], simple = FALSE)
    index <- which(df$samplePct == matchPct)
    upFrame <- df[index, c("blueprintId", matchMetric)]
    colnames(upFrame) <- c("blueprintId", metricNames[i])
    outFrame <- merge(outFrame, upFrame, by = "blueprintId")
  }
  return(outFrame)
}

## ---- echo = TRUE--------------------------------------------------------
metricNames <- c("originalRMSE", paste("X", seq(1, 10, 1), "RMSE", sep = ""))
mergeFrame <- PermutationMerge(modelList, 16, metricNames)

## ---- echo=FALSE, fig.width=7,fig.height=6, fig.cap="Beanplot summary of RMSE versus random permutation.", warnings=FALSE, message=FALSE----
par(mfrow = c(1, 1))
library(beanplot)
BeanNames <- c("None", paste("X", seq(1, 10, 1), sep = ""))
beanplot(mergeFrame[, 5:15], names = BeanNames,
         xlab = "Permutation", ylab = "RMSE",
         col = c("transparent", "red", "red", "blue"),
         las = 2,
         what = c(0, 1, 0, 1))

## ---- echo = TRUE--------------------------------------------------------
ComputeDeltas <- function(mergeFrame, refCol, permNames, shiftNames) {
  allNames <- colnames(mergeFrame)
  refIndex <- which(allNames == refCol)
  xRef <- mergeFrame[, refIndex]
  permCols <- which(allNames %in% permNames)
  xPerm <- mergeFrame[, permCols]
  deltas <- xPerm - xRef
  colnames(deltas) <- shiftNames
  deltas$New <- xRef
  newIndex <- which(colnames(deltas) == "New")
  colnames(deltas)[newIndex] <- refCol
  return(deltas)
}

## ---- echo = TRUE--------------------------------------------------------
allNames <- colnames(mergeFrame)
refCol <- allNames[5]
permNames <- allNames[6:15]
shiftNames <- paste("X", seq(1, 10, 1), sep = "")
deltaFrame <- ComputeDeltas(mergeFrame, refCol, permNames, shiftNames)

## ---- echo=FALSE, fig.width=7,fig.height=6, fig.cap="Beanplot summary of RMSE shifts versus random permutation."----
par(mfrow=c(1, 1))
beanplot(deltaFrame[, 1:10],
         xlab = "Permutation", ylab = "RMSE Shift",
         col = c("transparent", "red", "red", "blue"),
         what = c(0, 1, 1, 1))
bestRow <- which.min(deltaFrame$originalRMSE)
bestModel <- mergeFrame$modelType[bestRow]
points(seq(1, 10, 1), deltaFrame[bestRow, 1:10], pch = 16, col = "limegreen", cex = 1.5)
legend("topright", col = c("limegreen", "blue"), pch = c(16, 15), cex = 1.2,
       legend = c(bestModel, "Average"))
abline(h = 0, lty = 2)

## ---- echo = TRUE--------------------------------------------------------
varImpSummary <- function(deltaFrame, refCol, oneIndex) {
  vars <- colnames(deltaFrame)
  refIndex <- which(vars == refCol)
  refValue <- deltaFrame[, refIndex]
  wts <- 1/refValue  # Performance-weights = reciprocal fitting measure
  deltasOnly <- deltaFrame[, -refIndex]
  thisModel <- as.numeric(deltasOnly[oneIndex, ])
  avg <- apply(deltasOnly, MARGIN=2, mean)
  WtAvgFunction <- function(x, w) { sum(w * x) / sum(w) }
  wtAvg <- apply(deltasOnly, MARGIN = 2, WtAvgFunction, wts)
  varImpFrame <- data.frame(average = avg,
                            weightedAverage = wtAvg,
                            oneModel = thisModel)
  return(varImpFrame)
}

## ---- echo = FALSE-------------------------------------------------------
varImp <- varImpSummary(deltaFrame, "originalRMSE", bestRow)
avg <- round(varImp$average, digits = 3)
wtAvg <- round(varImp$weightedAverage, digits = 3)
best <- round(varImp$oneModel, digits = 3)
df <- data.frame(Avg = avg, WtdAvg = wtAvg, Best = best)

## ---- echo = FALSE-------------------------------------------------------
df

