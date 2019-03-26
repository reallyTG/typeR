library(FLLat)


### Name: predict.FLLat
### Title: Predicted Values and Weights based on the Fused Lasso Latent
###   Feature Model
### Aliases: predict.FLLat

### ** Examples

## Load simulated aCGH data.
data(simaCGH)

## Divide the data into a training and test set.
tr.dat <- simaCGH[,1:15]
tst.dat <- simaCGH[,16:20]

## Run FLLat for J = 5, lam1 = 1 and lam2 = 9 on the training set.
result.tr <- FLLat(tr.dat,J=5,lam1=1,lam2=9)

## Calculate fitted values on the training set.
tr.pred <- predict(result.tr)

## Calculate predicted values and weights on the test set using the FLLat
## model (i.e., the features) fitted on the training set.
tst.pred <- predict(result.tr,newY=tst.dat)

## Plotting predicted values and data for the first sample in the test set.
plot(tst.dat[,1],xlab="Probe",ylab="Y")
lines(tst.pred$pred.Y[,1],col="red",lwd=3)



