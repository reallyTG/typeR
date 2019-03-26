## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      message = FALSE,
                      warning = FALSE)

## ----dataset-------------------------------------------------------------
data(pbc, package = "randomForestSRC")
pbc <- pbc[complete.cases(pbc),]
pbc$sex <- as.factor(pbc$sex)
pbc$stage <- as.factor(pbc$stage)

## ---- models-------------------------------------------------------------
set.seed(1024)
library(rms)
library(survxai)
cph_model <- cph(Surv(days/365, status)~., data = pbc, surv = TRUE, x = TRUE, y=TRUE)

surve_cph <- explain(model = cph_model,
                     data = pbc[,-c(1,2)], y = Surv(pbc$days/365, pbc$status))

## ------------------------------------------------------------------------
library(prodlim)
library(randomForestSRC)

predict_rf <- function(object, newdata, times, ...){
  f <- sapply(newdata, is.integer)
  cols <- names(which(f))
  object$xvar[cols] <- lapply(object$xvar[cols], as.integer)
  ptemp <- predict(object,newdata=newdata,importance="none")$survival
  pos <- prodlim::sindex(jump.times=object$time.interest,eval.times=times)
  p <- cbind(1,ptemp)[,pos+1,drop=FALSE]
  return(p)
}

## ------------------------------------------------------------------------
pbc$year <- pbc$days/365
rf_model <- rfsrc(Surv(year, status)~., data = pbc[,-1])

surve_rf <- explain(model = rf_model,
                    data = pbc[,-c(1,2,20)], y = Surv(pbc$year, pbc$status),
                    predict_function = predict_rf)

## ------------------------------------------------------------------------
library(survival)

predict_reg <- function(model, newdata, times){
  times <- sort(times)
  vars <- all.vars(model$call[[2]][[2]])
  n_vars <- which(colnames(newdata) %in% vars)
  if(length(n_vars)>0){
    newdata <- newdata[,-c(n_vars)]
  }
  model$x <- model.matrix(~., newdata)
  res <- matrix(ncol = length(times), nrow = nrow(newdata))
  for(i in 1:nrow(newdata)) {
    res[i,] <- cfc.survreg.survprob(t = times, args = model, n = i)    
  }
  return(res)
}


## ------------------------------------------------------------------------
reg_model <- survreg(Surv(year, status)~., data = pbc[,-1], x = TRUE)

surve_reg <- explain(model = rf_model,
                    data = pbc[,-c(1,2,20)], 
                    y = Surv(pbc$year, pbc$status),
                    predict_function = predict_reg)

