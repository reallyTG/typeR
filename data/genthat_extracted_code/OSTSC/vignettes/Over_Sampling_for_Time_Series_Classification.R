## ----echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE-----------------
 require(knitcitations)
 cleanbib()
 options("citation_format" = "pandoc")

## ---- echo=FALSE, message=FALSE------------------------------------------
require(OSTSC)
require(keras)
require(dummies)
require(pROC)
ed <- local(get(load(url('https://github.com/lweicdsor/GSoC2017/raw/master/ElectricDevices%20LSTM%20model%20saved/ElectricalDevices_Precomputed.rdata'))))
ecg <- local(get(load(url('https://github.com/lweicdsor/GSoC2017/raw/master/ECG%20LSTM%20model%20saved/ECG_Precomputed.rdata'))))
mhealth <- local(get(load(url('https://github.com/lweicdsor/GSoC2017/raw/master/Mhealth%20LSTM%20model%20saved/MHEALTH_Precomputed.rdata'))))
hft <- local(get(load(url('https://github.com/lweicdsor/GSoC2017/raw/master/HFT%20LSTM%20model%20saved/HFT_Precomputed.rdata'))))

## ------------------------------------------------------------------------
data(Dataset_Synthetic_Control)

train.label <- Dataset_Synthetic_Control$train.y
train.sample <- Dataset_Synthetic_Control$train.x
test.label <- Dataset_Synthetic_Control$test.y
test.sample <- Dataset_Synthetic_Control$test.x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ------------------------------------------------------------------------
dim(over.sample)

## ------------------------------------------------------------------------
data(Dataset_Adiac)

train.label <- Dataset_Adiac$train.y
train.sample <- Dataset_Adiac$train.x
test.label <- Dataset_Adiac$test.y
test.sample <- Dataset_Adiac$test.x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ------------------------------------------------------------------------
data(Dataset_HFT300)

train.label <- Dataset_HFT300$y
train.sample <- Dataset_HFT300$x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ------------------------------------------------------------------------
ElectricalDevices <- Dataset_ElectricalDevices()

train.label <- ElectricalDevices$train.y
train.sample <- ElectricalDevices$train.x
test.label <- ElectricalDevices$test.y
test.sample <- ElectricalDevices$test.x
vali.label <- ElectricalDevices$vali.y
vali.sample <- ElectricalDevices$vali.x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ---- eval = FALSE-------------------------------------------------------
#  library(keras)
#  library(dummies)
#  train.y <- dummy(train.label)
#  test.y <- dummy(test.label)
#  train.x <- array(train.sample, dim = c(dim(train.sample),1))
#  test.x <- array(test.sample, dim = c(dim(test.sample),1))
#  vali.y <- dummy(vali.label)
#  vali.x <- array(vali.sample, dim = c(dim(vali.sample),1))
#  over.y <- dummy(over.label)
#  over.x <- array(over.sample, dim = c(dim(over.sample),1))

## ---- eval = FALSE-------------------------------------------------------
#  K <- backend()
#  
#  metric_f1_0 <- function(y_true, y_pred) { # positive is 0
#    true_positives <- K$sum(y_true*y_pred, axis=K$cast(0,dtype='int32'))[1]
#    possible_positives <- K$sum(y_true,axis=K$cast(0,dtype='int32'))[1]
#    recall <- true_positives / (possible_positives + K$epsilon())
#  
#    predicted_positives<- K$sum(y_pred,axis=K$cast(0,dtype='int32'))[1]
#    precision <- true_positives / (predicted_positives + K$epsilon())
#    return(2*((precision*recall)/(precision+recall+ K$epsilon())))
#  }
#  
#  metric_f1_1 <- function(y_true, y_pred) { # positive is 1
#    true_positives <- K$sum(y_true*y_pred, axis=K$cast(0,dtype='int32'))[2]
#    possible_positives <- K$sum(y_true,axis=K$cast(0,dtype='int32'))[2]
#    recall <- true_positives / (possible_positives + K$epsilon())
#    predicted_positives<- K$sum(y_pred,axis=K$cast(0,dtype='int32'))[2]
#    precision <- true_positives / (predicted_positives + K$epsilon())
#    return(2*((precision*recall)/(precision+recall+ K$epsilon())))
#  }
#  
#  metric_f1_2 <- function(y_true, y_pred) { # positive is 2
#    true_positives <- K$sum(y_true*y_pred, axis=K$cast(0,dtype='int32'))[3]
#    possible_positives <- K$sum(y_true,axis=K$cast(0,dtype='int32'))[3]
#    recall <- true_positives / (possible_positives + K$epsilon())
#    predicted_positives<- K$sum(y_pred,axis=K$cast(0,dtype='int32'))[3]
#    precision <- true_positives / (predicted_positives + K$epsilon())
#    return(2*((precision*recall)/(precision+recall+ K$epsilon())))
#  }
#  
#  LossHistory <- R6::R6Class("LossHistory",
#    inherit = KerasCallback,
#  
#    public = list(
#  
#      losses = NULL,
#      f1_0s    = NULL,
#      f1_1s    = NULL,
#      f1_2s    = NULL,
#      val_f1_0s= NULL,
#      val_f1_1s= NULL,
#      val_f1_2s= NULL,
#  
#      on_epoch_end = function(epoch, logs = list()) {
#        self$losses <- c(self$losses, logs[["loss"]])
#        self$f1_0s    <- c(self$f1_0s, logs[["f1_score_0"]])
#        self$f1_1s    <- c(self$f1_1s, logs[["f1_score_1"]])
#        self$f1_2s    <- c(self$f1_2s, logs[["f1_score_2"]])
#        self$val_f1_0s    <- c(self$val_f1_0s, logs[["val_f1_score_0"]])
#        self$val_f1_1s    <- c(self$val_f1_1s, logs[["val_f1_score_1"]])
#        self$val_f1_2s    <- c(self$val_f1_2s, logs[["val_f1_score_2"]])
#      }
#  ))
#  
#  model <- keras_model_sequential()
#  model %>%
#      layer_lstm(10, input_shape = c(dim(train.x)[2], dim(train.x)[3])) %>%
#      #layer_dropout(rate = 0.1) %>%
#      layer_dense(dim(train.y)[2]) %>%
#      layer_dropout(rate = 0.1) %>%
#      layer_activation("softmax")
#  history <- LossHistory$new()
#  model %>% compile(
#      loss = "categorical_crossentropy",
#      optimizer = optimizer_adam(lr = 0.005),
#      metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1)
#  )
#  lstm.before <- model %>% fit(
#      x = train.x,
#      y = train.y,
#      validation_data=list(vali.x,vali.y),
#      batch_size = 256,
#      callbacks = list(history),
#      epochs = 50
#  )
#  
#  model.over <- keras_model_sequential()
#  model.over %>%
#      layer_lstm(10, input_shape = c(dim(over.x)[2], dim(over.x)[3])) %>%
#      #layer_dropout(rate = 0.1) %>%
#      layer_dense(dim(over.y)[2]) %>%
#      layer_dropout(rate = 0.1) %>%
#      layer_activation("softmax")
#  history.over <- LossHistory$new()
#  model.over %>% compile(
#      loss = "categorical_crossentropy",
#      optimizer = optimizer_adam(lr = 0.005),
#      metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1)
#  )
#  lstm.after <- model.over %>% fit(
#      x = over.x,
#      y = over.y,
#      validation_data=list(vali.x,vali.y),
#      batch_size = 256,
#      callbacks = list(history.over),
#      epochs = 50
#  )

## ---- echo = FALSE, message=FALSE----------------------------------------
pred.label <- as.vector(unlist(ed$pred.label)) 
history.val_f1_0s <- as.vector(unlist(ed$history.val_f1_0s)) 
history.val_f1_1s <- as.vector(unlist(ed$history.val_f1_1s)) 
history.losses <- as.vector(unlist(ed$history.losses)) 
pred.label.over <- as.vector(unlist(ed$pred.label.over)) 
history.over.val_f1_0s <- as.vector(unlist(ed$history.over.val_f1_0s)) 
history.over.val_f1_1s <- as.vector(unlist(ed$history.over.val_f1_1s)) 
history.over.losses <- as.vector(unlist(ed$history.over.losses)) 

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 1) of the LSTM classifier trained on the unbalanced and balanced Electrical Devices dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_1s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on Electrical Devices dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_1s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 0) of the LSTM classifier trained on the unbalanced and balanced Electrical Devices dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_0s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on Electrical Devices dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_0s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("bottomright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The losses of the LSTM classifier trained on the unbalanced and balanced Electrical Devices dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.losses, type = "b", pch = 0, col = "blue", main = "Loss of the LSTM classifier on Electrical Devices dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0, 1), xlim = c(0, 50))
lines(history.over.losses, type = "b", pch = 19, col = "red")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("Loss", side = 2, las = 1, line = 2)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- eval = FALSE-------------------------------------------------------
#  pred.label <- model %>% predict_classes(test.x)
#  pred.label.over <- model.over %>% predict_classes(test.x)

## ---- echo = FALSE-------------------------------------------------------
cm.before <- table(test.label, pred.label)
cm.after <- table(test.label, pred.label.over)
res <- as.numeric(cm.before)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
f1_1 <- 2*res[4]/(2*res[4]+res[2]+res[3])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3])
cat("The class 1 F1 score without oversampling: ", f1_1)
cat("The class 0 F1 score without oversampling: ", f1_0)
res <- as.numeric(cm.after)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
f1_1 <- 2*res[4]/(2*res[4]+res[2]+res[3])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3])
cat("The class 1 F1 score with oversampling: ", f1_1)
cat("The class 0 F1 score with oversampling: ", f1_0)

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the Electrical Devices dataset without oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(150, 430, 240, 370, col='#3F97D0')
rect(250, 430, 340, 370, col='#F7AD50')
rect(150, 305, 240, 365, col='#F7AD50')
rect(250, 305, 340, 365, col='#3F97D0')
text(195, 435, '0', cex=1.1)
text(295, 435, '1', cex=1.1)
text(125, 370, 'True', cex=1.2, srt=90, font=2)
text(245, 450, 'Predicted', cex=1.2, font=2)
text(140, 400, '0', cex=1.1, srt=90)
text(140, 335, '1', cex=1.1, srt=90)
res <- as.numeric(cm.before)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
sum1 <- res[1] + res[3]
sum2 <- res[2] + res[4] 
text(195, 400, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(195, 335, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(295, 400, round(res[3]/sum1, 4), cex=1.3, font=2, col='white')
text(295, 335, round(res[4]/sum2, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the Electrical Devices dataset with oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(150, 430, 240, 370, col='#3F97D0')
rect(250, 430, 340, 370, col='#F7AD50')
rect(150, 305, 240, 365, col='#F7AD50')
rect(250, 305, 340, 365, col='#3F97D0')
text(195, 435, '5', cex=1.1)
text(295, 435, '6', cex=1.1)
text(125, 370, 'True', cex=1.2, srt=90, font=2)
text(245, 450, 'Predicted', cex=1.2, font=2)
text(140, 400, '5', cex=1.1, srt=90)
text(140, 335, '6', cex=1.1, srt=90)
res <- as.numeric(cm.after)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
sum1 <- res[1] + res[3]
sum2 <- res[2] + res[4] 
text(195, 400, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(195, 335, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(295, 400, round(res[3]/sum1, 4), cex=1.3, font=2, col='white')
text(295, 335, round(res[4]/sum2, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, warning = FALSE, message = FALSE, fig.width = 4, fig.height = 4, fig.cap = "ROC curves comparing the effect of oversampling on the performance of LSTM applied to the Electrical Devices dataset."----
library(pROC)
par(pty = "s")
plot.roc(as.vector(test.label), pred.label, legacy.axes = TRUE, col = "blue", print.auc = TRUE,  
         print.auc.cex= .8, xlab = 'False Positive Rate', ylab = 'True Positive Rate', lty = "dashed")
plot.roc(as.vector(test.label), pred.label.over, legacy.axes = TRUE, col = "red", print.auc = TRUE,   
         print.auc.y = .4, print.auc.cex= .8, add = TRUE)
legend("bottomright", legend=c("Before Oversampling", "After Oversampling"), 
       col=c("blue", "red"), lwd=2, cex= .6, lty = c("dashed", "solid"))

## ------------------------------------------------------------------------
ECG <- Dataset_ECG()

train.label <- ECG$train.y
train.sample <- ECG$train.x
test.label <- ECG$test.y
test.sample <- ECG$test.x
vali.label <- ECG$vali.y
vali.sample <- ECG$vali.x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ---- eval = FALSE-------------------------------------------------------
#  library(keras)
#  library(dummies)
#  train.y <- dummy(train.label)
#  test.y <- dummy(test.label)
#  train.x <- array(train.sample, dim = c(dim(train.sample),1))
#  test.x <- array(test.sample, dim = c(dim(test.sample),1))
#  vali.y <- dummy(vali.label)
#  vali.x <- array(vali.sample, dim = c(dim(vali.sample),1))
#  over.y <- dummy(over.label)
#  over.x <- array(over.sample, dim = c(dim(over.sample),1))
#  
#  model <- keras_model_sequential()
#  model %>%
#      layer_lstm(10, input_shape = c(dim(train.x)[2], dim(train.x)[3])) %>%
#      #layer_dropout(rate = 0.1) %>%
#      layer_dense(dim(train.y)[2]) %>%
#      layer_dropout(rate = 0.1) %>%
#      layer_activation("softmax")
#  history <- LossHistory$new()
#  model %>% compile(
#      loss = "categorical_crossentropy",
#      optimizer = optimizer_adam(lr = 0.001),
#      metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1,
#                  'f1_score_2' = metric_f1_2)
#  )
#  lstm.before <- model %>% fit(
#      x = train.x,
#      y = train.y,
#      validation_data=list(vali.x,vali.y),
#      batch_size = 256,
#      callbacks = list(history),
#      epochs = 50
#  )
#  
#  model.over <- keras_model_sequential()
#  model.over %>%
#      layer_lstm(10, input_shape = c(dim(over.x)[2], dim(over.x)[3])) %>%
#      #layer_dropout(rate = 0.1) %>%
#      layer_dense(dim(over.y)[2]) %>%
#      layer_dropout(rate = 0.1) %>%
#      layer_activation("softmax")
#  history.over <- LossHistory$new()
#  model.over %>% compile(
#      loss = "categorical_crossentropy",
#      optimizer = optimizer_adam(lr = 0.001),
#      metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1,
#                  'f1_score_2' = metric_f1_2)
#  )
#  lstm.after <- model.over %>% fit(
#      x = over.x,
#      y = over.y,
#      validation_data=list(vali.x,vali.y),
#      batch_size = 256,
#      callbacks = list(history.over),
#      epochs = 50
#  )

## ---- echo = FALSE, message=FALSE----------------------------------------
pred.label <- as.vector(unlist(ecg$pred.label)) 
history.val_f1_0s <- as.vector(unlist(ecg$history.val_f1_0s)) 
history.val_f1_1s <- as.vector(unlist(ecg$history.val_f1_1s)) 
history.val_f1_2s <- as.vector(unlist(ecg$history.val_f1_2s)) 
history.losses <- as.vector(unlist(ecg$history.losses)) 
pred.label.over <- as.vector(unlist(ecg$pred.label.over)) 
history.over.val_f1_0s <- as.vector(unlist(ecg$history.over.val_f1_0s)) 
history.over.val_f1_1s <- as.vector(unlist(ecg$history.over.val_f1_1s)) 
history.over.val_f1_2s <- as.vector(unlist(ecg$history.over.val_f1_2s)) 
history.over.losses <- as.vector(unlist(ecg$history.over.losses)) 

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 2) of the LSTM classifier trained on the unbalanced and balanced Electrocardiogram dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_2s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on Electrocardiogram dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_2s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 1) of the LSTM classifier trained on the unbalanced and balanced Electrocardiogram dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_1s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on Electrocardiogram dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_1s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 0) of the LSTM classifier trained on the unbalanced and balanced Electrocardiogram dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_0s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on Electrocardiogram dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_0s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("bottomright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The losses of the LSTM classifier trained on the unbalanced and balanced Electrocardiogram dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.losses, type = "b", pch = 0, col = "blue", main = "Loss of the LSTM classifier on Electrocardiogram dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0, 1.2), xlim = c(0, 50))
lines(history.over.losses, type = "b", pch = 19, col = "red")
axis(1, at = c(0,5,10,15,20,25,30,35,40,45,50),labels = c(0,5,10,15,20,25,30,35,40,45,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2), las = 1)
mtext("Loss", side = 2, las = 1, line = 2)
legend("topright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- eval = FALSE-------------------------------------------------------
#  pred.label <- model %>% predict_classes(test.x)
#  pred.label.over <- model.over %>% predict_classes(test.x)

## ---- echo = FALSE-------------------------------------------------------
cm.before <- table(test.label, pred.label)
cm.after <- table(test.label, pred.label.over)
res <- as.numeric(cm.before)
for (i in 1:9){
  res[i][is.na(res[i])] <- 0
}
f1_2 <- 2*res[9]/(2*res[9]+res[3]+res[6]+res[7]+res[8])
f1_1 <- 2*res[5]/(2*res[5]+res[2]+res[4]+res[6]+res[8])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3]+res[4]+res[7])
cat("The class 2 F1 score without oversampling: ", f1_2)
cat("The class 1 F1 score without oversampling: ", f1_1)
cat("The class 0 F1 score without oversampling: ", f1_0)
res <- as.numeric(cm.after)
for (i in 1:9){
  res[i][is.na(res[i])] <- 0
}
f1_2 <- 2*res[9]/(2*res[9]+res[3]+res[6]+res[7]+res[8])
f1_1 <- 2*res[5]/(2*res[5]+res[2]+res[4]+res[6]+res[8])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3]+res[4]+res[7])
cat("The class 2 F1 score with oversampling: ", f1_2)
cat("The class 1 F1 score with oversampling: ", f1_1)
cat("The class 0 F1 score with oversampling: ", f1_0)

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrices of LSTM applied to the Electrocardiogram dataset without oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(140, 430, 200, 390, col='#3F97D0')
rect(210, 430, 270, 390, col='#F7AD50')
rect(280, 430, 340, 390, col='#F7AD50')
rect(140, 345, 200, 385, col='#F7AD50')
rect(210, 345, 270, 385, col='#3F97D0')
rect(280, 345, 340, 385, col='#F7AD50')
rect(140, 300, 200, 340, col='#F7AD50')
rect(210, 300, 270, 340, col='#F7AD50')
rect(280, 300, 340, 340, col='#3F97D0')
text(170, 435, '0', cex=1.1)
text(240, 435, '1', cex=1.1)
text(310, 435, '2', cex=1.1)
text(130, 410, '0', cex=1.1, srt=90)
text(130, 365, '1', cex=1.1, srt=90)
text(130, 320, '2', cex=1.1, srt=90)
text(120, 370, 'True', cex=1.2, srt=90, font=2)
text(240, 450, 'Predicted', cex=1.2, font=2)
  
res <- as.numeric(cm.before)
sum1 <- res[1] + res[4] + res[7]
sum2 <- res[2] + res[5] + res[8]
sum3 <- res[3] + res[6] + res[9]
text(170, 410, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(170, 365, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(170, 320, round(res[3]/sum3, 4), cex=1.3, font=2, col='white')
text(240, 410, round(res[4]/sum1, 4), cex=1.3, font=2, col='white')
text(240, 365, round(res[5]/sum2, 4), cex=1.3, font=2, col='white')
text(240, 320, round(res[6]/sum3, 4), cex=1.3, font=2, col='white')
text(310, 410, round(res[7]/sum1, 4), cex=1.3, font=2, col='white')
text(310, 365, round(res[8]/sum2, 4), cex=1.3, font=2, col='white')
text(310, 320, round(res[9]/sum3, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the Electrocardiogram dataset with oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(140, 430, 200, 390, col='#3F97D0')
rect(210, 430, 270, 390, col='#F7AD50')
rect(280, 430, 340, 390, col='#F7AD50')
rect(140, 345, 200, 385, col='#F7AD50')
rect(210, 345, 270, 385, col='#3F97D0')
rect(280, 345, 340, 385, col='#F7AD50')
rect(140, 300, 200, 340, col='#F7AD50')
rect(210, 300, 270, 340, col='#F7AD50')
rect(280, 300, 340, 340, col='#3F97D0')
text(170, 435, '0', cex=1.1)
text(240, 435, '1', cex=1.1)
text(310, 435, '2', cex=1.1)
text(130, 410, '0', cex=1.1, srt=90)
text(130, 365, '1', cex=1.1, srt=90)
text(130, 320, '2', cex=1.1, srt=90)
text(120, 370, 'True', cex=1.2, srt=90, font=2)
text(240, 450, 'Predicted', cex=1.2, font=2)

res <- as.numeric(cm.after)
sum1 <- res[1] + res[4] + res[7]
sum2 <- res[2] + res[5] + res[8]
sum3 <- res[3] + res[6] + res[9]
text(170, 410, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(170, 365, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(170, 320, round(res[3]/sum3, 4), cex=1.3, font=2, col='white')
text(240, 410, round(res[4]/sum1, 4), cex=1.3, font=2, col='white')
text(240, 365, round(res[5]/sum2, 4), cex=1.3, font=2, col='white')
text(240, 320, round(res[6]/sum3, 4), cex=1.3, font=2, col='white')
text(310, 410, round(res[7]/sum1, 4), cex=1.3, font=2, col='white')
text(310, 365, round(res[8]/sum2, 4), cex=1.3, font=2, col='white')
text(310, 320, round(res[9]/sum3, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, warning = FALSE, message = FALSE, fig.width = 4, fig.height = 4, fig.cap = "ROC curves of LSTM applied to the Electrocardiogram dataset, with and without oversampling."----
library(pROC)
par(pty = "s")
plot.roc(as.vector(test.label), pred.label, legacy.axes = TRUE, col = "blue", print.auc = TRUE,  
         print.auc.cex= .8, xlab = 'False Positive Rate', ylab = 'True Positive Rate', lty = "dashed")
plot.roc(as.vector(test.label), pred.label.over, legacy.axes = TRUE, col = "red", print.auc = TRUE,   
         print.auc.y = .4, print.auc.cex= .8, add = TRUE)
legend("bottomright", legend=c("Before Oversampling", "After Oversampling"), 
       col=c("blue", "red"), lwd=2, cex= .6, lty = c("dashed", "solid"))

## ------------------------------------------------------------------------
MHEALTH <- Dataset_MHEALTH()

train.label <- MHEALTH$train.y
train.sample <- MHEALTH$train.x
test.label <- MHEALTH$test.y
test.sample <- MHEALTH$test.x
vali.label <- MHEALTH$vali.y
vali.sample <- MHEALTH$vali.x

## ------------------------------------------------------------------------
dim(train.sample)

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ---- eval = FALSE-------------------------------------------------------
#  train.y <- dummy(train.label)
#  test.y <- dummy(test.label)
#  train.x <- array(train.sample, dim = c(dim(train.sample),1))
#  test.x <- array(test.sample, dim = c(dim(test.sample),1))
#  vali.y <- dummy(vali.label)
#  vali.x <- array(vali.sample, dim = c(dim(vali.sample),1))
#  over.y <- dummy(over.label)
#  over.x <- array(over.sample, dim = c(dim(over.sample),1))
#  
#  model <- keras_model_sequential()
#  model %>%
#    layer_lstm(10, input_shape = c(dim(train.x)[2], dim(train.x)[3])) %>%
#    layer_dropout(rate = 0.2) %>%
#    layer_dense(dim(train.y)[2]) %>%
#    layer_dropout(rate = 0.2) %>%
#    layer_activation("softmax")
#  history <- LossHistory$new()
#  model %>% compile(
#    loss = "categorical_crossentropy",
#    optimizer = "adam",
#    metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1)
#  )
#  lstm.before <- model %>% fit(
#    x = train.x,
#    y = train.y,
#    validation_data=list(vali.x,vali.y),
#    callbacks = list(history),
#    epochs = 50
#  )
#  
#  model.over <- keras_model_sequential()
#  model.over %>%
#    layer_lstm(10, input_shape = c(dim(over.x)[2], dim(over.x)[3])) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_dense(dim(over.y)[2]) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_activation("softmax")
#  history.over <- LossHistory$new()
#  model.over %>% compile(
#    loss = "categorical_crossentropy",
#    optimizer = "adam",
#    metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1)
#  )
#  lstm.after <- model.over %>% fit(
#    x = over.x,
#    y = over.y,
#    validation_data=list(vali.x,vali.y),
#    callbacks = list(history.over),
#    epochs = 50
#  )
#  
#  pred.label <- model %>% predict_classes(test.x)
#  pred.label.over <- model.over %>% predict_classes(test.x)

## ---- echo = FALSE, message=FALSE----------------------------------------
pred.label <- as.vector(unlist(mhealth$pred.label)) 
history.val_f1_0s <- as.vector(unlist(mhealth$history.val_f1_0s)) 
history.val_f1_1s <- as.vector(unlist(mhealth$history.val_f1_1s)) 
history.losses <- as.vector(unlist(mhealth$history.losses)) 
pred.label.over <- as.vector(unlist(mhealth$pred.label.over)) 
history.over.val_f1_0s <- as.vector(unlist(mhealth$history.over.val_f1_0s)) 
history.over.val_f1_1s <- as.vector(unlist(mhealth$history.over.val_f1_1s)) 
history.over.losses <- as.vector(unlist(mhealth$history.over.losses)) 

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 1) of the LSTM classifier trained on the unbalanced and balanced MHEALTH dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_1s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on MHEALTH dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_1s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,10,20,30,40,50),labels = c(0,10,20,30,40,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 0) of the LSTM classifier trained on the unbalanced and balanced MHEALTH dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_0s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on MHEALTH dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 50))
lines(history.val_f1_0s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,10,20,30,40,50),labels = c(0,10,20,30,40,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("bottomright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The losses of the LSTM classifier trained on the unbalanced and balanced MHEALTH dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.losses, type = "b", pch = 0, col = "blue", main = "Loss of the LSTM classifier on MHEALTH dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0, 1), xlim = c(0, 50))
lines(history.over.losses, type = "b", pch = 19, col = "red")
axis(1, at = c(0,10,20,30,40,50),labels = c(0,10,20,30,40,50), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("Loss", side = 2, las = 1, line = 2)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- echo = FALSE-------------------------------------------------------
cm.before <- table(test.label, pred.label)
cm.after <- table(test.label, pred.label.over)
res <- as.numeric(cm.before)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
f1_1 <- 2*res[4]/(2*res[4]+res[2]+res[3])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3])
cat("The class 1 F1 score without oversampling: ", f1_1)
cat("The class 0 F1 score without oversampling: ", f1_0)
res <- as.numeric(cm.after)
for (i in 1:4){
  res[i][is.na(res[i])] <- 0
}
f1_1 <- 2*res[4]/(2*res[4]+res[2]+res[3])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3])
cat("The class 1 F1 score with oversampling: ", f1_1)
cat("The class 0 F1 score with oversampling: ", f1_0)

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the MHEALTH dataset without oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(150, 430, 240, 370, col='#3F97D0')
rect(250, 430, 340, 370, col='#F7AD50')
rect(150, 305, 240, 365, col='#F7AD50')
rect(250, 305, 340, 365, col='#3F97D0')
text(195, 435, '0', cex=1.1)
text(295, 435, '1', cex=1.1)
text(125, 370, 'True', cex=1.2, srt=90, font=2)
text(245, 450, 'Predicted', cex=1.2, font=2)
text(140, 400, '0', cex=1.1, srt=90)
text(140, 335, '1', cex=1.1, srt=90)

res <- as.numeric(cm.before)
sum1 <- res[1] + res[3]
sum2 <- res[2] + res[4] 
text(195, 400, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(195, 335, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(295, 400, round(res[3]/sum1, 4), cex=1.3, font=2, col='white')
text(295, 335, round(res[4]/sum2, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the MHEALTH dataset with oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(150, 430, 240, 370, col='#3F97D0')
rect(250, 430, 340, 370, col='#F7AD50')
rect(150, 305, 240, 365, col='#F7AD50')
rect(250, 305, 340, 365, col='#3F97D0')
text(195, 435, '0', cex=1.1)
text(295, 435, '1', cex=1.1)
text(125, 370, 'True', cex=1.2, srt=90, font=2)
text(245, 450, 'Predicted', cex=1.2, font=2)
text(140, 400, '0', cex=1.1, srt=90)
text(140, 335, '1', cex=1.1, srt=90)

res <- as.numeric(cm.after)
sum1 <- res[1] + res[3]
sum2 <- res[2] + res[4] 
text(195, 400, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(195, 335, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(295, 400, round(res[3]/sum1, 4), cex=1.3, font=2, col='white')
text(295, 335, round(res[4]/sum2, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, warning = FALSE, message = FALSE, fig.width = 4, fig.height = 4, fig.cap = "ROC curves of LSTM applied to the MHEALTH dataset, with and without oversampling."----
library(pROC)
par(pty = "s")
plot.roc(as.vector(test.label), pred.label, legacy.axes = TRUE, col = "blue", print.auc = TRUE,  
         print.auc.cex= .8, xlab = 'False Positive Rate', ylab = 'True Positive Rate', lty = "dashed")
plot.roc(as.vector(test.label), pred.label.over, legacy.axes = TRUE, col = "red", print.auc = TRUE,   
         print.auc.y = .4, print.auc.cex= .8, add = TRUE)
legend("bottomright", legend=c("Before Oversampling", "After Oversampling"), 
       col=c("blue", "red"), lwd=2, cex= .6, lty = c("dashed", "solid"))

## ------------------------------------------------------------------------
HFT <- Dataset_HFT()

label <- HFT$y
sample <- HFT$x
train.label <- label[1:20000]
train.sample <- sample[1:20000, ]
test.label <- label[23001:30000]
test.sample <- sample[23001:30000, ]
vali.label <- label[20001:23000]
vali.sample <- sample[20001:23000, ]

## ------------------------------------------------------------------------
table(train.label)

## ---- results='hide'-----------------------------------------------------
MyData <- OSTSC(train.sample, train.label, parallel = FALSE)
over.sample <- MyData$sample
over.label <- MyData$label

## ------------------------------------------------------------------------
table(over.label)

## ---- eval = FALSE-------------------------------------------------------
#  train.y <- dummy(train.label)
#  test.y <- dummy(test.label)
#  train.x <- array(train.sample, dim = c(dim(train.sample),1))
#  test.x <- array(test.sample, dim = c(dim(test.sample),1))
#  vali.y <- dummy(vali.label)
#  vali.x <- array(vali.sample, dim = c(dim(vali.sample),1))
#  over.y <- dummy(over.label)
#  over.x <- array(over.sample, dim = c(dim(over.sample),1))
#  
#  model <- keras_model_sequential()
#  model %>%
#    layer_lstm(10, input_shape = c(dim(train.x)[2], dim(train.x)[3])) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_dense(dim(train.y)[2]) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_activation("softmax")
#  history <- LossHistory$new()
#  model %>% compile(
#    loss = "categorical_crossentropy",
#    optimizer = "adam",
#    metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1,
#                'f1_score_2' = metric_f1_2)
#  )
#  lstm.before <- model %>% fit(
#    x = train.x,
#    y = train.y,
#    validation_data=list(vali.x,vali.y),
#    callbacks = list(history),
#    epochs = 100
#  )
#  
#  model.over <- keras_model_sequential()
#  model.over %>%
#    layer_lstm(10, input_shape = c(dim(train.x)[2], dim(train.x)[3])) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_dense(dim(train.y)[2]) %>%
#    layer_dropout(rate = 0.1) %>%
#    layer_activation("softmax")
#  history.over <- LossHistory$new()
#  model.over %>% compile(
#    loss = "categorical_crossentropy",
#    optimizer = "adam",
#    metrics = c("accuracy",'f1_score_0' = metric_f1_0, 'f1_score_1' = metric_f1_1,
#                'f1_score_2' = metric_f1_2)
#  )
#  lstm.after <- model.over %>% fit(
#      x = over.x,
#      y = over.y,
#      validation_data=list(vali.x,vali.y),
#      callbacks = list(history.over),
#      epochs = 100
#  )

## ---- echo = FALSE, message=FALSE----------------------------------------
pred.label <- as.vector(unlist(hft$pred.label)) 
history.val_f1_2s <- as.vector(unlist(hft$history.val_f1_m1s)) 
history.val_f1_0s <- as.vector(unlist(hft$history.val_f1_0s)) 
history.val_f1_1s <- as.vector(unlist(hft$history.val_f1_1s)) 
history.losses <- as.vector(unlist(hft$history.losses)) 
pred.label.over <- as.vector(unlist(hft$pred.label.over)) 
history.over.val_f1_2s <- as.vector(unlist(hft$history.over.val_f1_m1s)) 
history.over.val_f1_0s <- as.vector(unlist(hft$history.over.val_f1_0s)) 
history.over.val_f1_1s <- as.vector(unlist(hft$history.over.val_f1_1s)) 
history.over.losses <- as.vector(unlist(hft$history.over.losses)) 

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 1) of the LSTM classifier trained on the unbalanced and balanced HFT dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_1s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on HFT dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 100))
lines(history.val_f1_1s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,10,20,30,40,50,60,70,80,90,100),labels = c(0,10,20,30,40,50,60,70,80,90,100), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class 0) of the LSTM classifier trained on the unbalanced and balanced HFT dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_0s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on HFT dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 100))
lines(history.val_f1_0s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,10,20,30,40,50,60,70,80,90,100),labels = c(0,10,20,30,40,50,60,70,80,90,100), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("bottomright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The F1 scores (class -1) of the LSTM classifier trained on the unbalanced and balanced HFT dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.over.val_f1_2s, type = "b", pch = 19, col = "red", main = "F1 of the LSTM classifier on HFT dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0.0, 1.0), xlim = c(0, 100))
lines(history.val_f1_2s, type = "b", pch = 0, col = "blue")
axis(1, at = c(0,10,20,30,40,50,60,70,80,90,100),labels = c(0,10,20,30,40,50,60,70,80,90,100), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1), las = 1)
mtext("F1", side = 2, las = 1, line = 3)
legend("topleft", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- fig.width = 6, fig.height = 5, fig.cap = "The losses of the LSTM classifier trained on the unbalanced and balanced HFT dataset. Both metrics are evaluated at the end of each epoch.", echo = FALSE----
plot(history.losses, type = "b", pch = 0, col = "blue", main = "Loss of the LSTM classifier on HFT dataset", yaxt = "n", xaxt = "n", xlab = "Epoches", ylab = "", ylim = c(0, 1.2), xlim = c(0, 100))
lines(history.over.losses, type = "b", pch = 19, col = "red")
axis(1, at = c(0,10,20,30,40,50,60,70,80,90,100),labels = c(0,10,20,30,40,50,60,70,80,90,100), las = 1)
axis(2, at = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2), labels = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.1,1.2), las = 1)
mtext("Loss", side = 2, las = 1, line = 2)
legend("topright", legend = c("Balanced dataset", "Unbalanced dataset"), col = c("red","blue"), pch = c(19, 0), lty = c(NA, NA), bty = "n", lwd = 2, cex = 0.7)

## ---- eval = FALSE-------------------------------------------------------
#  pred.label <- model %>% predict_classes(test.x)
#  pred.label.over <- model.over %>% predict_classes(test.x)

## ---- echo = FALSE-------------------------------------------------------
cm.before <- table(test.label, pred.label)
cm.after <- table(test.label, pred.label.over)
res <- as.numeric(cm.before)
for (i in 1:9){
  res[i][is.na(res[i])] <- 0
}
f1_2 <- 2*res[9]/(2*res[9]+res[3]+res[6]+res[7]+res[8])
f1_1 <- 2*res[5]/(2*res[5]+res[2]+res[4]+res[6]+res[8])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3]+res[4]+res[7])
cat("The class 1 F1 score without oversampling: ", f1_2)
cat("The class 0 F1 score without oversampling: ", f1_1)
cat("The class -1 F1 score without oversampling: ", f1_0)
res <- as.numeric(cm.after)
for (i in 1:9){
  res[i][is.na(res[i])] <- 0
}
f1_2 <- 2*res[9]/(2*res[9]+res[3]+res[6]+res[7]+res[8])
f1_1 <- 2*res[5]/(2*res[5]+res[2]+res[4]+res[6]+res[8])
f1_0 <- 2*res[1]/(2*res[1]+res[2]+res[3]+res[4]+res[7])
cat("The class 1 F1 score with oversampling: ", f1_2)
cat("The class 0 F1 score with oversampling: ", f1_1)
cat("The class -1 F1 score with oversampling: ", f1_0)

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrices of LSTM applied to the HFT dataset without oversampling."----
cm.before <- table(test.label, pred.label)
cm.after <- table(test.label, pred.label.over)

layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(140, 430, 200, 390, col='#3F97D0')
rect(210, 430, 270, 390, col='#F7AD50')
rect(280, 430, 340, 390, col='#F7AD50')
rect(140, 345, 200, 385, col='#F7AD50')
rect(210, 345, 270, 385, col='#3F97D0')
rect(280, 345, 340, 385, col='#F7AD50')
rect(140, 300, 200, 340, col='#F7AD50')
rect(210, 300, 270, 340, col='#F7AD50')
rect(280, 300, 340, 340, col='#3F97D0')
text(170, 435, '-1', cex=1.1)
text(240, 435, '0', cex=1.1)
text(310, 435, '1', cex=1.1)
text(130, 410, '-1', cex=1.1, srt=90)
text(130, 365, '0', cex=1.1, srt=90)
text(130, 320, '1', cex=1.1, srt=90)
text(120, 370, 'True', cex=1.2, srt=90, font=2)
text(240, 450, 'Predicted', cex=1.2, font=2)
  
res <- as.numeric(cm.before)
sum1 <- res[1] + res[4] + res[7]
sum2 <- res[2] + res[5] + res[8]
sum3 <- res[3] + res[6] + res[9]
text(170, 410, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(170, 365, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(170, 320, round(res[3]/sum3, 4), cex=1.3, font=2, col='white')
text(240, 410, round(res[4]/sum1, 4), cex=1.3, font=2, col='white')
text(240, 365, round(res[5]/sum2, 4), cex=1.3, font=2, col='white')
text(240, 320, round(res[6]/sum3, 4), cex=1.3, font=2, col='white')
text(310, 410, round(res[7]/sum1, 4), cex=1.3, font=2, col='white')
text(310, 365, round(res[8]/sum2, 4), cex=1.3, font=2, col='white')
text(310, 320, round(res[9]/sum3, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, fig.width = 4, fig.height = 2, fig.cap = "Normalized confusion matrix of LSTM applied to the HFT dataset with oversampling."----
layout(matrix(c(1,1,1)))
par(mar=c(2,2,2,2))
plot(c(100, 345), c(300, 450), type = "n", xlab="", ylab="", xaxt='n', yaxt='n')

rect(140, 430, 200, 390, col='#3F97D0')
rect(210, 430, 270, 390, col='#F7AD50')
rect(280, 430, 340, 390, col='#F7AD50')
rect(140, 345, 200, 385, col='#F7AD50')
rect(210, 345, 270, 385, col='#3F97D0')
rect(280, 345, 340, 385, col='#F7AD50')
rect(140, 300, 200, 340, col='#F7AD50')
rect(210, 300, 270, 340, col='#F7AD50')
rect(280, 300, 340, 340, col='#3F97D0')
text(170, 435, '-1', cex=1.1)
text(240, 435, '0', cex=1.1)
text(310, 435, '1', cex=1.1)
text(130, 410, '-1', cex=1.1, srt=90)
text(130, 365, '0', cex=1.1, srt=90)
text(130, 320, '1', cex=1.1, srt=90)
text(120, 370, 'True', cex=1.2, srt=90, font=2)
text(240, 450, 'Predicted', cex=1.2, font=2)

res <- as.numeric(cm.after)
sum1 <- res[1] + res[4] + res[7]
sum2 <- res[2] + res[5] + res[8]
sum3 <- res[3] + res[6] + res[9]
text(170, 410, round(res[1]/sum1, 4), cex=1.3, font=2, col='white')
text(170, 365, round(res[2]/sum2, 4), cex=1.3, font=2, col='white')
text(170, 320, round(res[3]/sum3, 4), cex=1.3, font=2, col='white')
text(240, 410, round(res[4]/sum1, 4), cex=1.3, font=2, col='white')
text(240, 365, round(res[5]/sum2, 4), cex=1.3, font=2, col='white')
text(240, 320, round(res[6]/sum3, 4), cex=1.3, font=2, col='white')
text(310, 410, round(res[7]/sum1, 4), cex=1.3, font=2, col='white')
text(310, 365, round(res[8]/sum2, 4), cex=1.3, font=2, col='white')
text(310, 320, round(res[9]/sum3, 4), cex=1.3, font=2, col='white')

## ---- echo = FALSE, warning = FALSE, message = FALSE, fig.width = 4, fig.height = 4, fig.cap = "ROC curves of LSTM applied to the HFT dataset with and without oversampling."----
library(pROC)
par(pty = "s")
plot.roc(as.vector(test.label), pred.label, legacy.axes = TRUE, col = "blue", print.auc = TRUE,  
         print.auc.cex= .8, xlab = 'False Positive Rate', ylab = 'True Positive Rate', lty = "dashed")
plot.roc(as.vector(test.label), pred.label.over, legacy.axes = TRUE, col = "red", print.auc = TRUE,   
         print.auc.y = .4, print.auc.cex= .8, add = TRUE)
legend("bottomright", legend=c("Before Oversampling", "After Oversampling"), 
       col=c("blue", "red"), lwd=2, cex= .6, lty = c("dashed", "solid"))

## ----echo=FALSE, eval=TRUE, message=FALSE, warning=FALSE-----------------
#read.bibtex(file = "referenceOSTSC.bib")

