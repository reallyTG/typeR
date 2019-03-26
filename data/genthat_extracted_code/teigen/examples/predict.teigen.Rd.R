library(teigen)


### Name: predict.teigen
### Title: predict.teigen: Predicting Function for tEIGEN Objects
### Aliases: predict.teigen

### ** Examples

set.seed(2521)
ind <- sample(1:nrow(faithful), 20)
set.seed(256)
tfaith_unscaled <- teigen(faithful[-ind,], models = "UUUU", Gs = 2, verbose = FALSE, scale=FALSE)
pred_unscaled <- predict(tfaith_unscaled, faithful[ind,])
set.seed(256)
tfaith_scaled <- teigen(faithful[-ind,], models = "UUUU", Gs = 2, verbose = FALSE, scale=TRUE)
pred_scaled <- predict(tfaith_scaled, faithful[ind,])
identical(pred_unscaled$classification, pred_scaled$classification)

##Plotting UNSCALED
plot(tfaith_unscaled, what="contour")
points(faithful[ind,1], faithful[ind,2], pch=15)
plotcolours <- rainbow(tfaith_unscaled$G)
points(faithful[ind,1], faithful[ind,2], pch=20, col=plotcolours[pred_unscaled$classification])

##Plotting SCALED
plot(tfaith_scaled, what="contour")
points((faithful[ind,1]-tfaith_scaled$info$scalemeans[1])/tfaith_scaled$info$scalesd[1],
       (faithful[ind,2]-tfaith_scaled$info$scalemeans[2])/tfaith_scaled$info$scalesd[2],
       pch=15)
plotcolours <- rainbow(tfaith_scaled$G)
points((faithful[ind,1]-tfaith_scaled$info$scalemeans[1])/tfaith_scaled$info$scalesd[1],
       (faithful[ind,2]-tfaith_scaled$info$scalemeans[2])/tfaith_scaled$info$scalesd[2],
       pch=20, col=plotcolours[pred_scaled$classification])




