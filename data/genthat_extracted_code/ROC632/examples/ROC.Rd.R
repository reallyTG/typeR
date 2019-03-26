library(ROC632)


### Name: ROC
### Title: Estimation of the traditional ROC curves (without censoring)
### Aliases: ROC
### Keywords: ROC curve

### ** Examples


# import and attach the data example

X <- c(1, 2, 3, 4, 5, 6, 7, 8) # The value of the marker
Y <- c(0, 0, 0, 1, 0, 1, 1, 1) # The value of the binary outcome

ROC.obj <- ROC(status=Y, marker=X, cut.values=sort(X))
plot(ROC.obj$FP, ROC.obj$TP, ylab="True Positive Rates",
 xlab="False Positive Rates", type="s", lwd=2)



