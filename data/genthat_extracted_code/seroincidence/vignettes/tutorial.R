## ---- echo = FALSE-------------------------------------------------------
pkgUrl <- gsub("\n", "", packageDescription("seroincidence")$URL)

## ------------------------------------------------------------------------
# Load package "seroincidence"
library(seroincidence)

## ---- eval=FALSE---------------------------------------------------------
## # List all objects (functions and data) exposed by package "seroincidence".
## ls("package:seroincidence")

## ---- echo=FALSE---------------------------------------------------------
ls("package:seroincidence")

## ------------------------------------------------------------------------
# Show three first rows of "campylobacterSimMediumData" data.frame.
head(campylobacterSimMediumData, 3)

## ------------------------------------------------------------------------
# Assign data.frame "campylobacterDelftData" to object named "serologyData".
serologyData <- with(campylobacterSimMediumData,
                     data.frame(
                       Age = Age,
                       IgG = IgG,
                       IgM = IgM,
                       IgA = IgA,
                       AgeCat = cut(Age, 15, labels = FALSE)))

# Print a few first observations.
head(serologyData)

## ---- eval=FALSE---------------------------------------------------------
## View(serologyData)

## ---- eval=FALSE---------------------------------------------------------
## # Read content of file "C:\cross-sectional-data.csv" into object named
## # "serologyData".
## serologyData <- read.csv(file = "C:\\cross-sectional-data.csv")

## ------------------------------------------------------------------------
# Show first rows of data.frame "IgG" in list "campylobacterDelftParams4".
head(campylobacterDelftParams4$IgG)

# Show first rows of data.frame "IgM" in list "campylobacterDelftParams4".
head(campylobacterDelftParams4$IgM)

# Show first rows of data.frame "IgA" in list "campylobacterDelftParams4".
head(campylobacterDelftParams4$IgA)

## ------------------------------------------------------------------------
responseParams <- campylobacterDelftParams4

## ---- eval=FALSE---------------------------------------------------------
## IgGData <- read.csv(file = "IgG.csv")
## IgMData <- read.csv(file = "IgM.csv")
## IgAData <- read.csv(file = "IgA.csv")
## 
## # Create a list named "responseData" containing objects named "IgG", "IgM" and
## # "IgA".
## responseParams <- list(IgG = IgGData, IgM = IgMData, IgA = IgAData)

## ---- eval=FALSE---------------------------------------------------------
## responseParams <- getAdditionalData("coxiellaIFAParams4.zip")

## ---- eval=FALSE---------------------------------------------------------
## # Prepare input data.
## serologyData <- with(campylobacterSimMediumData,
##                      data.frame(
##                        Age = rep(NA, nrow(campylobacterSimMediumData)),
##                        IgG = IgG,
##                        IgM = IgM,
##                        IgA = IgA,
##                        AgeCat = cut(Age, 15, labels = FALSE)))
## 
## responseParams <- campylobacterDelftParams4
## 
## cutOffs <- list(IgG = 0.1, IgM = 0.1, IgA = 0.1)
## 
## # Baseline distributions: the distributions of antibody concentrations in
## # subjects who have never seroconverted.
## baseLine <- list(IgG = c(log(0.05), 1),
##                  IgM = c(log(0.005), 1),
##                  IgA = c(log(0.005), 1))
## 
## # Assign output of function "estimateSeroincidence" to object named
## # "seroincidenceData". Use all available processor cores.
## seroincidenceData <- estimateSeroincidence(
##   data = serologyData,
##   antibodies = c("IgG", "IgM", "IgA"),
##   strata = "AgeCat",
##   params = responseParams,
##   censorLimits = cutOffs,
##   par0 = baseLine,
##   start = -4,
##   numCores = parallel::detectCores())
## 
## # Show content of the output variable...
## print(seroincidenceData)
## # ...or simply type in the console: 'seroincidenceData' (without "'") and
## # press ENTER.

## ---- eval=FALSE---------------------------------------------------------
## censorLimits <- list(IgG = 0, IgM = 0, IgA = 0)

## ---- eval=FALSE---------------------------------------------------------
## summary(seroincidenceData)

## ---- eval=FALSE---------------------------------------------------------
## # Compute seroincidence summary and assign to object "seroincidenceSummary".
## seroincidenceSummary <- summary(seroincidenceData)
## 
## # Show the results.
## seroincidenceSummary$Results

## ---- eval=FALSE---------------------------------------------------------
## # 1. Define cross-sectional data.
## serologyData <- with(campylobacterSimMediumData,
##                      data.frame(
##                        IgG = IgG.ratio.new,
##                        IgM = IgM.ratio.new,
##                        IgA = IgA.ratio.new))
## 
## # 2. Define longitudinal response data
## responseParams <- campylobacterDelftParams3
## 
## # 3. Define cut-offs
## cutOffs <- list(IgG = 0.25, IgM = 0.25, IgA = 0.25)
## 
## # 4. Baseline distributions
## baseLine <- list(IgG = c(log(0.05), 1),
##                  IgM = c(log(0.005), 1),
##                  IgA = c(log(0.005), 1))
## 
## # 4a. Calculate a single seroincidence rate for all serum samples...
## seroincidenceData <- estimateSeroincidence(
##   data = serologyData,
##   antibodies = c("IgG", "IgM", "IgA"),
##   strata = "",
##   params = responseParams,
##   censorLimits = cutOffs,
##   par0 = baseLine)
## 
## # 4b. ...or calculate a single seroincidence rate for a single serum sample
## # (triplet of titres)...
## seroincidenceData <- estimateSeroincidence(
##   data = serologyData[1, ],
##   antibodies = c("IgG", "IgM", "IgA"),
##   strata = "",
##   params = responseParams,
##   censorLimits = cutOffs,
##   par0 = baseLine)
## 
## # 4c. ...or calculate a single seroincidence rate for all serum samples (only IgG)
## seroincidenceData <- estimateSeroincidence(
##   data = serologyData,
##   antibodies = c("IgG"),
##   strata = "",
##   params = responseParams,
##   censorLimits = cutOffs,
##   par0 = baseLine)
## 
## # 5a. Produce summary of the results with 2.5% and 97.5% bounds...
## summary(seroincidenceData)
## 
## # 5b. ...or produce summary of the results with 5% and 95% bounds, do not show
## # convergence...
## summary(seroincidenceData, quantiles = c(0.05, 0.95), showConvergence = FALSE)
## 
## # 5c. ...or produce summary and assign to an object...
## seroincidenceSummary <- summary(seroincidenceData)
## # ...and work with the results object from now on (here: display the results).
## seroincidenceSummary$Results

