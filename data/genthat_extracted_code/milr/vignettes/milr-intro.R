## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(cache = 2, cache.lazy = FALSE, tidy = FALSE, warning = FALSE)
library(knitcitations)

## ---- eval=FALSE---------------------------------------------------------
#  milr(y, x, bag, lambda, numLambda, lambdaCriterion, nfold, maxit)
#  softmax(y, x, bag, alpha, ...)

## ---- eval=FALSE---------------------------------------------------------
#  fitted(object, type)
#  predict(object, newdata, bag_newdata, type)

## ----DGP1----------------------------------------------------------------
library(milr)
library(pipeR)
set.seed(99)
# set the size of dataset
numOfBag <- 50
numOfInstsInBag <- 3
# set true coefficients: beta_0, beta_1, beta_2, beta_3
trueCoefs <- c(-2, -2, -1, 1, 2, 0.5, 0, 0, 0, 0, 0)
trainData <- DGP(numOfBag, numOfInstsInBag, trueCoefs)
colnames(trainData$X) <- paste0("X", 1:ncol(trainData$X))
(instanceResponse <- as.numeric(with(trainData, tapply(Z, ID, any))))

## ----EST2----------------------------------------------------------------
# fit milr model
milrFit_EST <- milr(trainData$Z, trainData$X, trainData$ID, lambda = 0)
# call the Wald test result
summary(milrFit_EST)
# call the regression coefficients
coef(milrFit_EST)

## ----EST-----------------------------------------------------------------
fitted(milrFit_EST, type = "bag") 
# fitted(milrFit_EST, type = "instance") # instance-level fitted labels
table(DATA = instanceResponse, FITTED = fitted(milrFit_EST, type = "bag")) 
# predict for testing data
testData <- DGP(numOfBag, numOfInstsInBag, trueCoefs)
colnames(testData$X) <- paste0("X", 1:ncol(testData$X))
(instanceResponseTest <- as.numeric(with(trainData, tapply(Z, ID, any))))
pred_EST <- with(testData, predict(milrFit_EST, X, ID, type = "bag"))
# predict(milrFit_EST, testData$X, testData$ID, 
#         type = "instance") # instance-level prediction
table(DATA = instanceResponseTest, PRED = pred_EST) 

## ----VS, message=FALSE---------------------------------------------------
set.seed(99)
# Set the new coefficienct vector (large p)
trueCoefs_Lp <- c(-2, -2, -1, 1, 2, 0.5, rep(0, 95))
# Generate the new training data with large p
trainData_Lp <- DGP(numOfBag, numOfInstsInBag, trueCoefs_Lp)
colnames(trainData_Lp$X) <- paste0("X", 1:ncol(trainData_Lp$X))
# variable selection by user-defined tuning set
lambdaSet <- exp(seq(log(0.01), log(50), length = 50))
milrFit_VS <- with(trainData_Lp, milr(Z, X, ID, lambda = lambdaSet))
# grep the active factors and their corresponding coefficients
coef(milrFit_VS) %>>% `[`(abs(.) > 0)

## ----AUTOVS,message=FALSE------------------------------------------------
# variable selection using auto-tuning
milrFit_auto_VS <- milr(trainData_Lp$Z, trainData_Lp$X, trainData_Lp$ID,
                        lambda = -1, numLambda = 50) 
# the auto-selected lambda values
milrFit_auto_VS$lambda 
# the values of BIC under each lambda value
milrFit_auto_VS$BIC
# grep the active factors and their corresponding coefficients
coef(milrFit_auto_VS) %>>% `[`(abs(.) > 0)

## ----CV,message=FALSE----------------------------------------------------
# variable selection using auto-tuning with cross validation
milrFit_auto_CV <- milr(trainData_Lp$Z, trainData_Lp$X, trainData_Lp$ID,
                        lambda = -1, numLambda = 50, 
                        lambdaCriterion = "deviance", nfold = 10) 
# the values of predictive deviance under each lambda value
milrFit_auto_CV$cv 
# grep the active factors and their corresponding coefficients
coef(milrFit_auto_CV) %>>% `[`(abs(.) > 0)

## ----DLMUSK1-------------------------------------------------------------
dataName <- "MIL-Data-2002-Musk-Corel-Trec9.tgz"
dataUrl <- "http://www.cs.columbia.edu/~andrews/mil/data/"

## ----READMUSK1-----------------------------------------------------------
filePath <- file.path(getwd(), dataName)
# Download MIL data sets from the url
if (!file.exists(filePath))
  download.file(paste0(dataUrl, dataName), filePath)
# Extract MUSK1 data file
if (!dir.exists("MilData"))
  untar(filePath, files = "MilData/Musk/musk1norm.svm")
# Read and Preprocess MUSK1
library(data.table)
MUSK1 <- fread("MilData/Musk/musk1norm.svm", header = FALSE) %>>%
  `[`(j = lapply(.SD, function(x) gsub("\\d+:(.*)", "\\1", x))) %>>%
  `[`(j = c("bag", "label") := tstrsplit(V1, ":")) %>>%
  `[`(j = V1 := NULL) %>>% `[`(j = lapply(.SD, as.numeric)) %>>%
  `[`(j = `:=`(bag = bag + 1, label = (label + 1)/2)) %>>%
  setnames(paste0("V", 2:(ncol(.)-1)), paste0("V", 1:(ncol(.)-2))) %>>%
  `[`(j = paste0("V", 1:(ncol(.)-2)) := lapply(.SD, scale), 
       .SDcols = paste0("V", 1:(ncol(.)-2)))
X <- paste0("V", 1:(ncol(MUSK1) - 2), collapse = "+") %>>% 
  (paste("~", .)) %>>% as.formula %>>% model.matrix(MUSK1) %>>% `[`( , -1L)
Y <- as.numeric(with(MUSK1, tapply(label, bag, function(x) sum(x) > 0)))

## ----CPUTIME,message=FALSE,results="hide"--------------------------------
# set the iterations from 5000 to 25000
itSet <- seq(5000, 20000, 3000)
outDT <- data.table(iteration = rep(itSet, each = 3), 
                    method = rep(c("s_0", "s_3", "milr"), length(itSet)), 
                    time = NA_real_, acc = NA_real_)
zzz <- sapply(seq(1L, nrow(outDT), 3L), function(i){
  j <- (i-1)/3 + 1
  # record the computation time
	tmp <- system.time(
		softmaxFit_0 <- softmax(MUSK1$label, X, MUSK1$bag, alpha = 0, 
		                        control = list(maxit = itSet[j])) 
	)[3]
	set(outDT, i, 3L, tmp)
	tmp <- system.time(
		softmaxFit_3 <- softmax(MUSK1$label, X, MUSK1$bag, alpha = 3, 
		                        control = list(maxit = itSet[j])) 
	)[3]
	set(outDT, i + 1L, 3L, tmp)
	tmp <- system.time(
	  # use a very small lambda so that milr do the estimation 
	  # without evaluating the Hessian matrix
		milrFit <- milr(MUSK1$label, X, MUSK1$bag, lambda = 1e-7, maxit = itSet[j]) 
	)[3]
	set(outDT, i + 2L, 3L, tmp)
	# calculate the accuracy
  tmp <- table(DATA = Y, FIT_s0 = fitted(softmaxFit_0, type = "bag")) 
  set(outDT, i, 4L, sum(diag(tmp))/sum(tmp))
	tmp <- table(DATA = Y, FIT_s3 = fitted(softmaxFit_3, type = "bag")) 
	set(outDT, i + 1L, 4L, sum(diag(tmp))/sum(tmp))
	tmp <- table(DATA = Y, FIT_MILR = fitted(milrFit, type = "bag"))
	set(outDT, i + 2L, 4L, sum(diag(tmp))/sum(tmp))
	invisible(NULL)
})
outDT[ , `:=`(iteration = iteration / 1000, acc = acc * 100)]
library(plyr)
outDT2 <- melt(outDT, 1:2, 3:4) %>>%
  `[`(j = variable := mapvalues(variable, c("time", "acc"), 
                                c("CPU Time (sec)", "Accuracy (%)")))

## ----PLOTCPUTIME,cache=TRUE,cache.lazy=FALSE,message=FALSE,warning=FALSE,echo=FALSE,tidy=FALSE,fig.cap="Computational efficiency of softmax methods and milr approach.", fig.width=7, fig.height=4----
library(ggplot2)
ggplot(outDT2, aes(iteration, value, colour = method)) + 
  labs(x = "Iterations (x 1000)", title = "The CPU Time and Fitted Accuracy") +
  geom_point(cex = 2) + geom_line() + 
  facet_wrap(~variable, scales = "free", switch = 'y') +
  theme(axis.title.y = element_blank(),
        strip.background = element_rect(fill = "transparent"),
        strip.placement = "outside", 
        plot.title = element_text(hjust = 0.5))

## ----MILRVS, cache=TRUE,cache.lazy=FALSE,message=FALSE,warning=FALSE,tidy=FALSE----
# MILR-LASSO
milrSV <- milr(MUSK1$label, X, MUSK1$bag, lambda = -1, numLambda = 100, 
               lambdaCriterion = "deviance", maxit = 16000)
# show the detected active covariates
sv_ind <- names(which(coef(milrSV)[-1L] != 0)) %>>% 
  (~ print(.)) %>>% match(colnames(X))
# use a very small lambda so that milr do the estimation 
# without evaluating the Hessian matrix
milrREFit <- milr(MUSK1$label, X[ , sv_ind], MUSK1$bag, 
                  lambda = 1e-7, maxit = 16000)
table(DATA = Y, FIT_MILR = fitted(milrREFit, type = "bag"))

## ----MUSK1PRED2,message=FALSE--------------------------------------------
set.seed(99)
predY <- matrix(0, length(Y), 4L) %>>%
  `colnames<-`(c("s0","s3","milr","milr_sv"))
folds <- 5
foldBag <- rep(1:folds, floor(length(Y) / folds) + 1, 
               length = length(Y)) %>>% sample(length(.))
foldIns <- rep(foldBag, table(MUSK1$bag))
for (i in 1:folds) {
  # prepare training and testing sets
  ind <- which(foldIns == i)
  # train models
  fit_s0 <- softmax(MUSK1[-ind, ]$label, X[-ind, ], MUSK1[-ind, ]$bag,
                    alpha = 0, control = list(maxit = 25000))
  fit_s3 <- softmax(MUSK1[-ind, ]$label, X[-ind, ], MUSK1[-ind, ]$bag,
                    alpha = 3, control = list(maxit = 25000))
  # milr, use a very small lambda so that milr do the estimation
  #       without evaluating the Hessian matrix
  fit_milr <- milr(MUSK1[-ind, ]$label, X[-ind, ], MUSK1[-ind, ]$bag,
                   lambda = 1e-7, maxit = 16000)
  fit_milr_sv <- milr(MUSK1[-ind, ]$label, X[-ind, sv_ind], MUSK1[-ind, ]$bag,
                      lambda = 1e-7, maxit = 16000)
  # store the predicted labels
  ind2 <- which(foldBag == i)
  # predict function returns bag response in default
  predY[ind2, 1L] <- predict(fit_s0, X[ind, ], MUSK1[ind, ]$bag)
  predY[ind2, 2L] <- predict(fit_s3, X[ind, ], MUSK1[ind, ]$bag)
  predY[ind2, 3L] <- predict(fit_milr, X[ind, ], MUSK1[ind, ]$bag)
  predY[ind2, 4L] <- predict(fit_milr_sv, X[ind, sv_ind], MUSK1[ind, ]$bag)
}

table(DATA = Y, PRED_s0 = predY[ , 1L])
table(DATA = Y, PRED_s3 = predY[ , 2L])
table(DATA = Y, PRED_MILR = predY[ , 3L])
table(DATA = Y, PRED_MILR_SV = predY[ , 4L])

