## ------------------------------------------------------------------------
require(Rdistance)

## ------------------------------------------------------------------------
data("thrasherDetectionData")
head(thrasherDetectionData)

## ------------------------------------------------------------------------
data("thrasherSiteData")
head(thrasherSiteData)

## ---- fig.width=6, fig.height=4------------------------------------------
hist(thrasherDetectionData$dist, n=40, col="grey", main="", xlab="distance (m)")
summary(thrasherDetectionData$dist)

## ---- fig.width=6, fig.height=4------------------------------------------

dfunc <- dfuncEstim(formula = dist ~ 1,
                    detectionData = thrasherDetectionData, 
                    pointSurvey = TRUE, 
                    likelihood = "halfnorm")

plot(dfunc)
dfunc

## ---- fig.width=6, fig.height=4, results='hide'--------------------------

# Estimate Abundance - Density; fatalities per m2
fit <- abundEstim(dfunc          = dfunc,
                   detectionData = thrasherDetectionData,
                   siteData      = thrasherSiteData,
                   area           = 10000,       # density per hectare
                   R              = 100, 
                   ci             = 0.95)

## ------------------------------------------------------------------------
fit

## ------------------------------------------------------------------------
fit$n.hat

## ------------------------------------------------------------------------
fit$ci

## ---- fig.width=6, fig.height=4, results='hide'--------------------------

# Automated Fit - fit several models, choose the best model based on AIC
autoDS <- autoDistSamp(formula       = thrasherDetectionData$dist ~ 1,
                     detectionData = thrasherDetectionData,
                     siteData      = thrasherSiteData,
                     pointSurvey   = TRUE,
                     expansions    = c(0),
                     likelihoods   = c("halfnorm", "hazrate", "negexp", "uniform"),
                     plot          = FALSE,
                     area          = 10000,
                     R             = 100,
                     ci            = 0.95,
                     plot.bs       = FALSE)

## ------------------------------------------------------------------------
autoDS

