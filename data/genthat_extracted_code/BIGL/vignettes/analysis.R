## ----init, message = FALSE-----------------------------------------------
library(BIGL)
library(knitr)
library(rgl)
library(ggplot2)
set.seed(12345)

## ----settings------------------------------------------------------------
nExp <- 4             # Dataset has 11 experiments, we consider only 4
cutoff <- 0.95        # Cutoff for p-values to use in plot.maxR() function

## ----data----------------------------------------------------------------
data("directAntivirals", package = "BIGL")
head(directAntivirals)

## ------------------------------------------------------------------------
subsetData <- function(data, i) {
  ## Subset data to a single experiment and, optionaly, select the necessary
  ## columns only
  subset(data, experiment == i)[, c("effect", "d1", "d2")]
}

## ----subset, out.width="100%"--------------------------------------------
i <- 1
data <- subsetData(directAntivirals, i)

## ----transformations-----------------------------------------------------
## Define forward and reverse transform functions
transforms <- list(
  "BiolT" = function(y, args) with(args, N0*exp(y*time.hours)),
  "InvBiolT" = function(T, args) with(args, 1/time.hours*log(T/N0)),
  "PowerT" = function(y, args) with(args, log(y)),
  "InvPowerT" = function(T, args) with(args, exp(T)),
  "compositeArgs" = list(N0 = 1,
                         time.hours = 72)
)

## ----autotransform, eval=FALSE-------------------------------------------
#  transforms_auto <- getTransformations(data)
#  fitMarginals(data, transforms = transforms_auto)
#  
#  ## In the case of 1-parameter Box-Cox transformation, it is easy
#  ## to retrieve the power parameter by evaluating the function at 0.
#  ## If parameter is 0, then it is a log-transformation.
#  with(transforms_auto, -1 / PowerT(0, compositeArgs))

## ----marginalFit---------------------------------------------------------
## Fitting marginal models
marginalFit <- fitMarginals(data, transforms = transforms, method = "nls", 
    names = c("Drug A", "Drug B"))
summary(marginalFit)

## ----marginalPlot, fig.align="center", fig.height = 4, fig.width = 6-----
## Plotting marginal models
plot(marginalFit) + ggtitle(paste("Direct-acting antivirals - Experiment" , i))

## ----marginalFitC, eval = FALSE------------------------------------------
#  ## Parameter ordering: h1, h2, b, m1, m2, e1, e2
#  ## Constraint 1: m1 = m2. Constraint 2: b = 10.
#  constraints <- list("matrix" = rbind(c(0, 0, 0, -1, 1, 0, 0),
#                                       c(0, 0, 1, 0, 0, 0, 0)),
#                      "vector" = c(0, 10))
#  
#  ## Parameter estimates will now satisfy equality:
#  ##   constraints$matrix %*% pars == constraints$vector
#  fitMarginals(data, transforms = transforms,
#               constraints = constraints)

## ----marginalFitFixed, eval = FALSE--------------------------------------
#  ## Set baseline at 1 and maximal responses at 0.
#  fitMarginals(data, transforms = transforms,
#               fixed = c("m1" = 0, "m2" = 0, "b" = 1))

## ----fallback, eval = FALSE----------------------------------------------
#  nlslmFit <- tryCatch({
#    fitMarginals(data, transforms = transforms,
#                 method = "nlslm")
#  }, warning = function(w) w, error = function(e) e)
#  
#  if (inherits(nlslmFit, c("warning", "error")))
#    optimFit <- tryCatch({
#      fitMarginals(data, transforms = transforms,
#                   method = "optim")
#    })

## ----eval=FALSE----------------------------------------------------------
#  marginalFit <- list("coef" = c("h1" = 1, "h2" = 2, "b" = 0,
#                                 "m1" = 1.2, "m2" = 1, "e1" = 0.5, "e2" = 0.5),
#                      "sigma" = 0.1,
#                      "df" = 123,
#                      "model" = constructFormula(),
#                      "shared_asymptote" = FALSE,
#                      "method" = "nlslm",
#                      "transforms" = transforms)
#  class(marginalFit) <- append(class(marginalFit), "MarginalFit")

## ----analysis, message=FALSE, comment = NA-------------------------------
rs <- fitSurface(data, marginalFit,
##               transforms = transforms,
                 null_model = "loewe",
                 B.CP = 50, statistic = "none", parallel = FALSE)
summary(rs)

## ----image, warning=FALSE, comment = NA, fig.width = 6, fig.height = 4, fig.align = "center"----
isobologram(rs)

## ----plot3d, warning=FALSE, fig.align="center", fig.height=7, fig.width=7----
plot(rs, legend = FALSE, main = "")
view3d(0, -75)
rglwidget()

## ----analysis_hsa, message=FALSE, comment = NA---------------------------
rsh <- fitSurface(data, marginalFit,
                  null_model = "hsa",
                  B.CP = 50, statistic = "both", parallel = FALSE)
summary(rsh)

## ----analysis_bliss, message=FALSE, comment = NA-------------------------
rsb <- fitSurface(data, marginalFit, 
                  null_model = "bliss",
                  B.CP = 50, statistic = "both", parallel = FALSE)
summary(rsb)

## ----meanrnorm, message = FALSE------------------------------------------
meanR_N <- fitSurface(data, marginalFit,
                      statistic = "meanR", CP = rs$CP, B.B = NULL,
                      parallel = FALSE)

## ----meanrnonnorm, message = FALSE---------------------------------------
meanR_B <- fitSurface(data, marginalFit,
                      statistic = "meanR", CP = rs$CP, B.B = 20,
                      parallel = FALSE)

## ----meanresults, echo=FALSE---------------------------------------------
MeanR_both <- rbind("Normal errors" = c(meanR_N$meanR$FStat, meanR_N$meanR$p.value),
                    "Bootstrapped errors" = c(meanR_B$meanR$FStat, meanR_B$meanR$p.value))
colnames(MeanR_both) <- c("F-statistic", "p-value")
kable(MeanR_both)

## ----maxboth, message = FALSE--------------------------------------------
maxR_N <- fitSurface(data, marginalFit,
                     statistic = "maxR", CP = rs$CP, B.B = NULL,
                     parallel = FALSE)
maxR_B <- fitSurface(data, marginalFit,
                     statistic = "maxR", CP = rs$CP, B.B = 20,
                     parallel = FALSE)
maxR_both <- rbind(summary(maxR_N$maxR)$totals,
                   summary(maxR_B$maxR)$totals)

## ----printmax, echo = FALSE----------------------------------------------
rownames(maxR_both) <- c("Normal errors", "Bootstrapped errors")
kable(maxR_both)

## ----maxoutside, results="asis"------------------------------------------
outPts <- outsidePoints(maxR_B$maxR$Ymean)
kable(outPts, caption = paste0("Non-additive points for Experiment ", i))

## ----maxcontour, fig.align="center", fig.width=6, fig.height=5-----------
contour(maxR_B,
         ## colorPalette = c("blue", "black", "black", "red"),
        main = paste0(" Experiment ", i, " contour plot for maxR"),
        scientific = TRUE, digits = 3, cutoff = cutoff)

## ----plot3dmax, warning=FALSE, fig.height=7, fig.width=7-----------------
plot(maxR_B, color = "maxR", legend = FALSE, main = "")
view3d(0, -75)
rglwidget()

## ----heterogenanalysis, fig.width=6, fig.height=5------------------------
marginalFit <- fitMarginals(data, transforms = NULL)
summary(marginalFit)

resM <- fitSurface(data, marginalFit, method = "model", 
    statistic = "both", B.CP = 20, B.B = 20, parallel = FALSE)

resU <- fitSurface(data, marginalFit, method = "unequal", 
    statistic = "both", B.CP = 20, B.B = 20, parallel = FALSE)

summary(resM) 
summary(resU)

## ----fullanalysis, message=FALSE-----------------------------------------
marginalFits <- list()
datasets <- list()
respSurfaces <- list()
maxR.summary <- list()
for (i in seq_len(nExp)) {
  ## Select experiment
  data <- subsetData(directAntivirals, i)
  ## Fit joint marginal model
  marginalFit <- fitMarginals(data, transforms = transforms,
                              method = "nlslm")
  ## Predict response surface based on generalized Loewe model
  respSurface <- fitSurface(data, marginalFit,
                            statistic = "maxR", B.CP = 20,
                            parallel = FALSE)

  datasets[[i]] <- data
  marginalFits[[i]] <- marginalFit
  respSurfaces[[i]] <- respSurface
  maxR.summary[[i]] <- summary(respSurface$maxR)$totals
}

## ----maxrfull, echo=FALSE------------------------------------------------
allMaxR <- do.call(rbind, maxR.summary)
rownames(allMaxR) <- paste("Experiment", 1:nrow(allMaxR))
kable(allMaxR, row.names = TRUE)

## ----tabs, echo = FALSE, results = "asis"--------------------------------
i <- 4
genCaption <- function(k) paste("Non-additive points for Experiment", k)
outPts <- outsidePoints(respSurfaces[[i]]$maxR$Ymean)
print(kable(outPts, caption = genCaption(i)))

## ----fullcontour, echo=FALSE, fig.align = "center", fig.width = 6, fig.height = 5----
i <- 4
contour(respSurfaces[[i]],
        main = paste("Experiment", i),
        scientific = TRUE, digits = 3, cutoff = cutoff)

