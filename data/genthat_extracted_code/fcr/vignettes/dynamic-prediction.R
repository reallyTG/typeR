## ----global_options, include=FALSE---------------------------------------
rm(list=ls()) ### To clear namespace
library(knitr)
opts_chunk$set(echo=TRUE, eval=FALSE)

## ----content_setup-------------------------------------------------------
#  library(fcr)
#  ## split the data into training and test data
#  data_full <- content
#  data      <- subset(data_full, include == 1)  ## data used in model fitting
#  data_test <- subset(data_full, include == 0)  ## out-of-sample data used in dynamic prediction
#  rm(list="data_full")
#  
#  k <- 12 # number of interior knots for fpca (results in k + 3 basis functions)
#  
#  ## Specify the functional domain where we want to make predictions.
#  ## We need to add in the times of observation for the test data
#  tnew <- sort(unique(c(data$argvals, data_test$argvals)))
#  
#  ###########################################
#  ## Step 1: Smooth time-varying covariate ##
#  ###########################################
#  dat.waz <- data.frame("y" = data$waz, "subj" = data$subj, argvals = data$argvals)
#  fit.waz <- face.sparse(dat.waz, newdata = dat.waz, knots = k, argvals.new = tnew)
#  data$wazPred <- fit.waz$y.pred

## ----fit_fcr-------------------------------------------------------------
#  #####################
#  ## Step 2: Fit fcr ##
#  #####################
#  
#  K <- 15 # dimenson of smooth for time varying coefficients
#  
#  ## The mean model in order of the formula presented below:
#  ##     E[Y_{ij}] = f_0(t_{ij}) + f_1(t_{ij})Male_i + f_2(t_{ij})\tilde{WAZ}_{ij}
#  ## note that we do not specify any random effects. That is done internally by fcr()
#  fit <- fcr(formula = Y ~ s(argvals, k=K, bs="ps") +
#                           s(argvals, by=Male, k=K, bs="ps") +
#                           s(argvals, by=wazPred, bs="ps"),
#             argvals = "argvals", subj="subj", data=data, use_bam=TRUE, argvals.new=tnew,
#             face.args = list(knots=k, pve=0.99))
#  

## ----visualize,fig.height=8,fig.width=16,fig.align='center'--------------
#  #####################
#  ## Examine results ##
#  #####################
#  
#  ## plot coefficients
#  par(mfrow=c(2,3),las=1)
#  for(k in 1:3) plot(fit,select=k)
#  # plot covariance function
#  plot(fit, plot.covariance=TRUE)

## ----prediction----------------------------------------------------------
#  ## do in-sample and dynamic prediction for subject 1
#  data_pred <- subset(data, subj==1)
#  
#  ## make two separate dataframes for dynamic prediction
#  ## and create make new subject id not used in model fitting
#  data_pred_dyn      <- data_pred_dyn2      <- data_pred
#  data_pred_dyn$subj <- data_pred_dyn2$subj <- data_pred_dyn$subj + 10000
#  
#  ## make "observed data" beyond t=0.5 NA
#  data_pred_dyn$Y[data_pred_dyn$argvals >= 0.5]   <- NA
#  data_pred_dyn$waz[data_pred_dyn$argvals >= 0.5] <- NA
#  
#  ## calculate dynamic waz scores
#  data_dyn_waz         <- data.frame("y" = data_pred_dyn$waz,
#                                     "subj" = data_pred_dyn$subj,
#                                     "argvals" = data_pred_dyn$argvals)
#  data_pred_dyn$wazPred <- predict(fit.waz, newdata=data_dyn_waz)$y.pred
#  
#  
#  ## perform predictions
#  in_samp <- predict(fit, newdata=data_pred, se.fit=TRUE)
#  dyn     <- predict(fit, newdata=data_pred_dyn)
#  dyn2    <- predict(fit, newdata=data_pred_dyn2)

## ----prediction_plot, echo=FALSE-----------------------------------------
#  
#  ## plot the predictions
#  ylims <- c(-1.5,0.75)
#  tplot <- data_pred$argvals
#  par(mfrow=c(1,1))
#  
#  plot(tplot,in_samp$insample_predictions$fit,xlab="t",ylab="haz",
#       type='l',xlim=c(0,1),ylim=ylims,main="Dynamic vs In-Sample Predictions")
#  lines(tplot,lty=2,
#        in_samp$insample_predictions$fit + 1.96*in_samp$insample_predictions$se.fit)
#  lines(tplot,lty=2,
#        in_samp$insample_predictions$fit - 1.96*in_samp$insample_predictions$se.fit)
#  
#  lines(tplot,lty=1,col='red',
#        dyn$dynamic_prediction$fitted.values$y.pred)
#  lines(tplot,lty=2,col='red',
#        dyn$dynamic_prediction$fitted.values$y.pred + 1.96*dyn$dynamic_prediction$fitted.values$se.fit)
#  lines(tplot,lty=2,col='red',
#        dyn$dynamic_prediction$fitted.values$y.pred - 1.96*dyn$dynamic_prediction$fitted.values$se.fit)
#  
#  lines(tplot,lty=1,col='blue',
#        dyn2$dynamic_prediction$fitted.values$y.pred)
#  lines(tplot,lty=2,col='blue',
#        dyn2$dynamic_prediction$fitted.values$y.pred + 1.96*dyn2$dynamic_prediction$fitted.values$se.fit)
#  lines(tplot,lty=2,col='blue',
#        dyn2$dynamic_prediction$fitted.values$y.pred - 1.96*dyn2$dynamic_prediction$fitted.values$se.fit)
#  
#  abline(v=0.5,lty=2,lwd=2,col='grey')
#  legend("top",c("In-sample","Dynamic (all data)","Dynamic (up to t=0.5)","", "Predicted Curve","95% CI"),
#         col=c("black","blue","red","black","black","black"),
#         lty=c(1,1,1,NA,2,1),lwd=2,bty="n",ncol=2)
#  
#  axis(1,0.5,labels=expression(t[m]==0.5))
#  

## ----dyn_pred_test-------------------------------------------------------
#  ## perform dynamic prediction for test subjects
#  ## on the last 1/2 of the functional domain
#  data_dyn <- data_test
#  data_dyn$Y[data_dyn$argvals >= 0.5]   <- NA
#  data_dyn$waz[data_dyn$argvals >= 0.5] <- NA
#  
#  ## remove smoothed waz -- dyanmic predictions calculated shortly
#  data_dyn$wazPred <- NULL
#  
#  
#  set.seed(1012341)
#  ids <- sample(unique(data_dyn$subj), 4, replace = FALSE)
#  
#  
#  data_plot <- c()
#  for(i in 1:length(ids)){
#          tmp <- subset(data_dyn, subj %in% ids[i])
#          ut_tmp <- tnew[!tnew %in% tmp$argvals & tnew > min(tmp$argvals)]
#          n_ut <- length(ut_tmp)
#          empty_dat <- data.frame("Y" = rep(NA,n_ut),
#                                  "Ytrue" = rep(NA,n_ut),
#                                  "X" = rep(NA,n_ut),
#                                  "waz.true"=rep(NA,n_ut),
#                                  "waz"=rep(NA,n_ut),
#                                  "Male" = rep(tmp$Male[1], n_ut),
#                                  "argvals"=ut_tmp,
#                                  "subj"=rep(tmp$subj[1],n_ut),
#                                  "include"=rep(0,n_ut))
#          tmp <- rbind(tmp, empty_dat)
#          tmp <- tmp[order(tmp$argvals),]
#  
#          data_plot <- rbind(data_plot, tmp)
#          rm(list=c("tmp","ut_tmp","n_ut","empty_dat"))
#  }
#  
#  data_dyn <- data_plot
#  rm(list=c("data_plot"))
#  
#  ## get dynamic waz predictions
#  data_dyn_waz     <- data.frame("y" = data_dyn$waz, "subj" = data_dyn$subj, "argvals" = data_dyn$argvals)
#  data_dyn$wazPred <- predict(fit.waz, newdata=data_dyn_waz)$y.pred
#  
#  preds <- predict(fit, newdata=data_dyn)$dynamic_predictions

## ----plot_test_dyn-------------------------------------------------------
#  par(mfrow=c(2,2),las=1)
#  for(i in 1:length(ids)){
#          inx <- which(data_dyn$subj==ids[i])
#          inx2 <-which(data_test$subj==ids[i])
#  
#          yl  <- range(c(preds$fitted.values$y.pred[inx] +
#                                 rep(c(1,-1),each=length(inx))*1.96*preds$fitted.values$se.fit.p[inx],
#                         data_test$Y[inx2]))
#  
#          plot(preds$data$argvals[inx], preds$fitted.values$y.pred[inx],type='l',
#               main = paste("Subject",i),xlab="Functional Domain", ylab="Response",
#               xlim=c(0,1), ylim=yl)
#          lines(preds$data$argvals[inx], lty=2,
#                preds$fitted.values$y.pred[inx] - 1.96*preds$fitted.values$se.fit[inx],col='blue')
#          lines(preds$data$argvals[inx], lty=2,
#                preds$fitted.values$y.pred[inx] + 1.96*preds$fitted.values$se.fit[inx],col='blue')
#  
#          lines(preds$data$argvals[inx],  lty=2,
#                preds$fitted.values$y.pred[inx] - 1.96*preds$fitted.values$se.fit.p[inx],col='red')
#          lines(preds$data$argvals[inx],  lty=2,
#                preds$fitted.values$y.pred[inx] + 1.96*preds$fitted.values$se.fit.p[inx],col='red')
#          axis(1,0.5,labels=expression(t[m]))
#  
#          points(data_test$argvals[inx2],data_test$Y[inx2])
#  
#          abline(v=0.5,col='grey',lty=2)
#          if(i == 4){
#                  legend("top",c("Observed Data","fcr() Prediction","95% Confidence Interval","95% Prediction Interval"),
#                         col=c("black","black","blue","red"),bty="n",pch=c(1,NA,NA,NA), lty = c(NA,1,2,2))
#          }
#  }

