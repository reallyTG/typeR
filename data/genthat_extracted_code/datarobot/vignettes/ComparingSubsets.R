## ---- echo = TRUE--------------------------------------------------------
library(mlbench)
data(PimaIndiansDiabetes)
str(PimaIndiansDiabetes)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 1: Normal QQ plots of four Pima Indians diabetes variables.", warning = FALSE, message = FALSE----
par(mfrow = c(2, 2))
library(car)
qqPlot(PimaIndiansDiabetes$glucose, ylab = "glucose")
title("Plasma glucose concentration")
qqPlot(PimaIndiansDiabetes$pressure, ylab = "pressure")
title("Diastolic blood pressure")
qqPlot(PimaIndiansDiabetes$triceps, ylab = "triceps")
title("Triceps skinfold thickness")
qqPlot(PimaIndiansDiabetes$insulin, ylab = "insulin")
title("Serum insulin")

## ---- echo = FALSE-------------------------------------------------------
MissPctInsulin <- round(100 * length(which(PimaIndiansDiabetes$insulin == 0)) /
                        nrow(PimaIndiansDiabetes), digits = 1)

## ---- echo = TRUE--------------------------------------------------------
insulinMissing <- as.numeric(PimaIndiansDiabetes$insulin == 0)
modifiedPima <- PimaIndiansDiabetes
modifiedPima$insulin <- NULL
modifiedPima$insulinMissing <- insulinMissing

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  insulinProject <- SetupProject(dataSource = modifiedPima, projectName = "InsulinProject")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  SetTarget(insulinProject, "insulinMissing")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  WaitForAutopilot(insulinProject)
#  insulinModelList <- ListModels(insulinProject)

## ----echo = FALSE, fig.width = 7, fig.height = 6, fig.cap = "Figure 2: Barplot of LogLoss values for the models predicting missingInsulin.", warning = FALSE, message = FALSE----
library(datarobot)
insulinModelList <- readRDS("insulinModelList.rds")
insulinModelFrame <- as.data.frame(insulinModelList, simple = FALSE)
par(mfrow = c(1, 1))
plot(insulinModelList, orderDecreasing = TRUE, xpos = 0.25, textSize = 0.6)

## ---- echo = FALSE-------------------------------------------------------
bestIndex <- which.min(insulinModelFrame$LogLoss.validation)
worstIndex <- which.max(insulinModelFrame$LogLoss.validation)
insulinModelFrame$expandedModel[bestIndex]

## ----echo = FALSE, fig.width = 7, fig.height = 6, fig.cap = "Figure 3: Plot of AUC values for the models predicting missingInsulin.", warning = FALSE, message = FALSE----
par(mfrow = c(1, 1))
plot(insulinModelFrame$AUC.validation, xlab = "Model number", ylab = "Area under the ROC curve")
points(bestIndex, insulinModelFrame$AUC.validation[bestIndex], pch = 16, col = "red")

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  modelList <- list(n = 9)
#  modelList[[1]] <- insulinModelList
#  allVars <- colnames(modifiedPima)[1:8]
#  permFile <- tempfile(fileext = "permFile.csv")
#  for (i in 1:8){
#    varName <- allVars[i]
#    PermuteColumn("modifiedPima.csv", varName, permFile)
#    projName <- paste("PermProject",varName,sep="")
#    permProject <- SetupProject(permFile, projectName = projName)
#    message(projName, "started: awaiting completion.")
#    SetTarget(permProject, target = "insulinMissing")
#    WaitForAutopilot(permProject, verbosity = 0)
#    modelList[[i+1]] <- ListModels(permProject)
#  }

## ----echo = FALSE, fig.width = 7, fig.height = 6, fig.cap="Figure 4: Beanplot summary of LogLoss shifts versus random permutation.", warning = FALSE, message = FALSE----
par(mfrow = c(1, 1))
library(beanplot)
logLossDeltas <- readRDS("insulinDeltaFrame.rds")
beanplot(logLossDeltas[, 1:8], las = 2, xlab = "", ylab = "LogLoss Shift",
         col = c("transparent", "red", "red", "blue"),
         what = c(0, 1, 1, 1))
bestRow <- which.min(logLossDeltas$originalLogLoss)
points(seq(1, 8, 1), logLossDeltas[bestRow, 1:8], pch = 16, col = "limegreen", cex = 1.5)
legend("topright", col = c("limegreen", "blue"), pch = c(16, 15), cex = 1.2,
       legend = c("Best", "Average"))
abline(h = 0, lty = 2)

## ----echo = FALSE, fig.width = 7, fig.height = 6, fig.cap = "Figure 5: Plot of AUC values for the original models (open circles) and those for the models with the random permutation applied to triceps (solid red triangles)", warning = FALSE, message = FALSE----
par(mfrow = c(1, 1))
AUCshiftFrame <- readRDS("AUCshiftFrame.rds")
sortIndex <- order(logLossDeltas$originalLogLoss)
plot(AUCshiftFrame$originalAUC[sortIndex], xlab = "Model number", ylab = "Area under ROC curve")
points(AUCshiftFrame$triceps[sortIndex], pch = 17, col = "red")

## ---- echo = FALSE-------------------------------------------------------
missingInsulin <- as.numeric(PimaIndiansDiabetes$insulin == 0)
missingTriceps <- as.numeric(PimaIndiansDiabetes$triceps == 0)
table(missingInsulin, missingTriceps)

## ---- echo = TRUE--------------------------------------------------------
library(insuranceData)
data(dataCar)

## ---- echo = TRUE--------------------------------------------------------
lossIndex <- which(dataCar$claimcst0 > 0)
keepVars <- c("veh_value", "exposure", "claimcst0", "veh_body", "veh_age",
              "gender", "area", "agecat")
lossFrame <- subset(dataCar, claimcst0 > 0, select = keepVars)

## ---- echo = FALSE-------------------------------------------------------
lossPct <- round(100 * length(lossIndex) / nrow(dataCar), digits = 1)
anomIndex <- which(lossFrame$claimcst0 == 200)
anomPct <- round(100 * length(anomIndex) / length(lossIndex), digits = 1)

## ---- echo = TRUE, eval = FALSE------------------------------------------
#  anomaly <- as.numeric(lossFrame$claimcst0 == 200)
#  anomFrame <- lossFrame
#  anomFrame$claimcst0 <- NULL
#  anomFrame$anomaly <- anomaly
#  anomProject <- SetupProject(anomFrame, projectName = "AnomalyProject")
#  SetTarget(anomProject, target = anomaly)
#  WaitForAutopilot(anomProject)
#  anomalyModelList <- ListModels(anomProject)

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 7: Horizontal barplot LogLoss summary of the 64% models for the small loss data.", warning = FALSE, message = FALSE----
par(mfrow = c(1, 1))
anomalyLeaderboard <- readRDS("anomalyModelList.rds")
anomalyLeaderFrame <- as.data.frame(anomalyLeaderboard, simple = FALSE)
plotPct <- max(anomalyLeaderFrame$samplePct)
plot(anomalyLeaderboard, pct = plotPct, orderDecreasing = TRUE, xlim = c(0, 0.45))
abline(v = min(anomalyLeaderFrame$LogLoss.validation), lty = 2, lwd = 2, col = "magenta")

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 8: Scatterplot summary of the AUC values for all models from AnomLossProject.", warning = FALSE, message = FALSE----
par(mfrow = c(1, 1))
AAUC <- anomalyLeaderFrame$AUC.validation
samplePct <- anomalyLeaderFrame$samplePct
sizes <- sort(unique(samplePct))
plot(AAUC, xlab = "Model number", ylab = "Area under ROC curve")
Index64 <- which(samplePct == sizes[3])
points(Index64, AAUC[Index64], pch = 16, col = "red")
Index32 <- which(samplePct == sizes[2])
points(Index32, AAUC[Index32], pch = 16, col = "limegreen")
Index16 <- which(samplePct == sizes[1])
points(Index16, AAUC[Index16], pch = 16, col = "blue")
legend("bottomleft", col = c("blue", "limegreen", "red"), pch = 16,
       legend = c("16% data sample", "32% data sample", "64% data sample"))

## ----echo = FALSE, fig.width=7,fig.height=6, fig.cap="Figure 9: Beanplot summary of AUC shifts versus random permutation.", warning = FALSE, message = FALSE----
anomAUCDeltaFrame <- readRDS("anomAUCDeltaFrame.rds")
bestIndex <- which.min(anomalyLeaderFrame$LogLoss.validation)
bestExpModel <- as.character(anomalyLeaderFrame$expandedModel)[bestIndex]
bestRow <- which(anomAUCDeltaFrame$expandedModel == bestExpModel)
par(mfrow = c(1, 1))
beanplot(anomAUCDeltaFrame[, 1:7], las = 2, xlab = "", ylab = "AUC Shift",
         col = c("transparent", "red", "red", "blue"),
         what=c(0, 1, 1, 1), ylim=c(-0.1, 0.1))
points(seq(1, 7, 1), anomAUCDeltaFrame[bestRow, 1:7], pch = 16, col = "limegreen", cex = 1.5)
legend("topright", col = c("limegreen", "blue"), pch = c(16, 15), cex = 1.2,
       legend = c("Best", "Average"))
abline(h = 0, lty = 2)

