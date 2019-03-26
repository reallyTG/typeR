library(ipred)


### Name: errorest
### Title: Estimators of Prediction Error
### Aliases: errorest errorest.data.frame errorest.default
### Keywords: misc

### ** Examples


# Classification

data("iris")
library("MASS")

# force predict to return class labels only
mypredict.lda <- function(object, newdata)
  predict(object, newdata = newdata)$class

# 10-fold cv of LDA for Iris data
errorest(Species ~ ., data=iris, model=lda, 
         estimator = "cv", predict= mypredict.lda)

data("PimaIndiansDiabetes", package = "mlbench")
## Not run: 
##D # 632+ bootstrap of LDA for Diabetes data
##D errorest(diabetes ~ ., data=PimaIndiansDiabetes, model=lda,
##D          estimator = "632plus", predict= mypredict.lda)
## End(Not run)

#cv of a fixed partition of the data
list.tindx <- list(1:100, 101:200, 201:300, 301:400, 401:500,
        501:600, 601:700, 701:768)

errorest(diabetes ~ ., data=PimaIndiansDiabetes, model=lda,
          estimator = "cv", predict = mypredict.lda,
          est.para = control.errorest(list.tindx = list.tindx))

## Not run: 
##D #both bootstrap estimations based on fixed partitions
##D 
##D list.tindx <- vector(mode = "list", length = 25)
##D for(i in 1:25) {
##D   list.tindx[[i]] <- sample(1:768, 768, TRUE)
##D }
##D 
##D errorest(diabetes ~ ., data=PimaIndiansDiabetes, model=lda,
##D           estimator = c("boot", "632plus"), predict= mypredict.lda,
##D           est.para = control.errorest(list.tindx = list.tindx))
##D 
## End(Not run)
data("Glass", package = "mlbench")

# LDA has cross-validated misclassification error of
# 38% (Ripley, 1996, page 98)

# Pruned trees about 32% (Ripley, 1996, page 230)

# use stratified sampling here, i.e. preserve the class proportions
errorest(Type ~ ., data=Glass, model=lda, 
         predict=mypredict.lda, est.para=control.errorest(strat=TRUE))

# force predict to return class labels
mypredict.rpart <- function(object, newdata)
  predict(object, newdata = newdata,type="class")

library("rpart")
pruneit <- function(formula, ...)
  prune(rpart(formula, ...), cp =0.01)

errorest(Type ~ ., data=Glass, model=pruneit,
         predict=mypredict.rpart, est.para=control.errorest(strat=TRUE))

# compute sensitivity and specifity for stabilised LDA

data("GlaucomaM", package = "TH.data")

error <- errorest(Class ~ ., data=GlaucomaM, model=slda,
  predict=mypredict.lda, est.para=control.errorest(predictions=TRUE))

# sensitivity 

mean(error$predictions[GlaucomaM$Class == "glaucoma"] == "glaucoma")

# specifity

mean(error$predictions[GlaucomaM$Class == "normal"] == "normal")

# Indirect Classification: Smoking data

data(Smoking)
# Set three groups of variables:
# 1) explanatory variables are: TarY, NicY, COY, Sex, Age
# 2) intermediate variables are: TVPS, BPNL, COHB
# 3) response (resp) is defined by:

resp <- function(data){
  data <- data[, c("TVPS", "BPNL", "COHB")]
  res <- t(t(data) > c(4438, 232.5, 58))
  res <- as.factor(ifelse(apply(res, 1, sum) > 2, 1, 0))
  res
}

response <- resp(Smoking[ ,c("TVPS", "BPNL", "COHB")])
smoking <- cbind(Smoking, response)

formula <- response~TVPS+BPNL+COHB~TarY+NicY+COY+Sex+Age

# Estimation per leave-one-out estimate for the misclassification is 
# 36.36% (Hand et al., 2001), using indirect classification with 
# linear models
## Not run: 
##D errorest(formula, data = smoking, model = inclass,estimator = "cv", 
##D          pFUN = list(list(model=lm, predict = mypredict.lm)), cFUN = resp,  
##D          est.para=control.errorest(k=nrow(smoking)))
## End(Not run)

# Regression

data("BostonHousing", package = "mlbench")

# 10-fold cv of lm for Boston Housing data
errorest(medv ~ ., data=BostonHousing, model=lm,
         est.para=control.errorest(random=FALSE))

# the same, with "model" returning a function for prediction
# instead of an object of class "lm"

mylm <- function(formula, data) {
  mod <- lm(formula, data)
  function(newdata) predict(mod, newdata)
}

errorest(medv ~ ., data=BostonHousing, model=mylm,
est.para=control.errorest(random=FALSE))


# Survival data

data("GBSG2", package = "TH.data")
library("survival")

# prediction is fitted Kaplan-Meier
predict.survfit <- function(object, newdata) object

# 5-fold cv of Kaplan-Meier for GBSG2 study
errorest(Surv(time, cens) ~ 1, data=GBSG2, model=survfit,
         predict=predict.survfit, est.para=control.errorest(k=5))





