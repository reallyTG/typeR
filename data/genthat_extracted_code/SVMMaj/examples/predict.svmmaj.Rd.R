library(SVMMaj)


### Name: predict.svmmaj
### Title: Out-of-Sample Prediction from Unseen Data.
### Aliases: predict.svmmaj

### ** Examples


attach(AusCredit)

## model training
model <- svmmaj(X[1:400, ], y[1:400], hinge = 'quadratic', lambda = 1)
## model prediction
q4     <- predict(model, X[-(1:400), ], y[-(1:400)], show.plot = TRUE)
q4



