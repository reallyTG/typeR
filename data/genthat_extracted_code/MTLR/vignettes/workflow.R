## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(survival)
#Looking at the top 6 rows...
head(lung)
#help(lung) #See the basic information of lung.

## ------------------------------------------------------------------------
lung <- lung[,-1]

## ------------------------------------------------------------------------
numberTrain <- floor(nrow(lung)*0.8)
set.seed(42)
trInd <- sample(1:nrow(lung), numberTrain)
training <- lung[trInd,]
testing <- lung[-trInd,]

## ------------------------------------------------------------------------
#Perform imputation
trMeans <- colMeans(training,na.rm=T)
for(i in 1:ncol(training)){
  training[is.na(training[,i]), i] <- trMeans[i]
  testing[is.na(testing[,i]), i] <- trMeans[i]
}

## ------------------------------------------------------------------------
formula <- Surv(time,status)~.

## ------------------------------------------------------------------------
formulaSmall <- Surv(time, status)~age+sex

## ------------------------------------------------------------------------
library(MTLR)
fullMod <- mtlr(formula = formula, data = training)
smallMod <- mtlr(formula = formulaSmall, data = training)
#We will print the small model so the output is more compact.
smallMod

## ---- fig.width=7, fig.align="center"------------------------------------
plot(fullMod)

## ------------------------------------------------------------------------
survCurves <- predict(fullMod, testing, type = "survivalcurve")
#survCurves is pretty large so we will look at the first 5 rows/columns.
survCurves[1:5,1:5]

## ---- fig.width=7, fig.height=5, fig.align="center"----------------------
plotcurves(survCurves, 1:10)

## ------------------------------------------------------------------------
#Mean
meanSurv <- predict(fullMod, testing, type = "mean_time")
head(meanSurv)
#Median
medianSurv <- predict(fullMod, testing, type = "median_time")
head(medianSurv)

## ---- echo=FALSE, out.width = '90%', fig.align="center"------------------
knitr::include_graphics("linearExtension.png")

## ------------------------------------------------------------------------
survivalProbs <- predict(fullMod, testing, type = "prob_event")
head(survivalProbs)
#To see what times these probabilities correspond to:
head(testing$time)

## ------------------------------------------------------------------------
mtlr_cv(formula,training, C1_vec = c(0.01,0.1,1,10,100))

## ---- echo=FALSE, out.width = '90%',fig.cap='The "fullstrat" method of cross-fold validation. Here "delta" refers to the feature used to identify censored/uncensored observations.', fig.align="center"----
knitr::include_graphics("crossvalidation.png")

## ------------------------------------------------------------------------
#Recall we are using the lung dataset.
testInd <- create_folds(lung$time, lung$status, nfolds = 5, foldtype = "fullstrat")

