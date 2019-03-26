library(MoEClust)


### Name: predict.MoEClust
### Title: Predictions for MoEClust models
### Aliases: predict.MoEClust residuals.MoEClust
### Keywords: clustering main utility

### ** Examples

data(ais)

# Fit a MoEClust model and predict the same data
res     <- MoE_clust(ais[,3:7], G=2, gating=~BMI, expert=~sex,
                     modelNames="EVE", network.data=ais)
pred1   <- predict(res)
pred1$classification

# Remove some rows of the data for prediction purposes
ind     <- sample(1:nrow(ais), 5)
dat     <- ais[-ind,]

# Fit another MoEClust model to the retained data
res2    <- MoE_clust(dat[,3:7], G=3, gating=~BMI + sex,
                     modelNames="EEE", network.data=dat)

# Predict held back data using the covariates & response variables
pred2   <- predict(res2, newdata=ais[ind,])
# pred2 <- predict(res2, newdata=list(new.y=ais[ind,3:7],
#                                     new.x=ais[ind,c("BMI", "sex")]))
pred2$y

# Get the residuals
residuals(res2, newdata=ais[ind,])

# Predict held back data using only the covariates
pred3   <- predict(res2, newdata=list(new.x=ais[ind,c("BMI", "sex")]))
# pred3 <- predict(res2, newdata=ais[ind,c("BMI", "sex")])
pred3$z



