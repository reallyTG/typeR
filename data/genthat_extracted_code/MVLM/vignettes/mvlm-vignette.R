## ---- message = F--------------------------------------------------------
library(MVLM)
data(mvlmdata)
Y <- as.matrix(Y.mvlm)

# Main effects
mvlm.res <- mvlm(Y ~ Cont + Cat + Ord, data = X.mvlm)
summary(mvlm.res)

# Two-Way Interactions
mvlm.res.int <- mvlm(Y ~ .^2, data = X.mvlm)
summary(mvlm.res.int)

## ---- message = F--------------------------------------------------------
# --- Main Effects Only --- #

# Get dummy-codes for the categorical predictor using the first group as a
# reference category, and then remove the leading column of 1's
X.dum <- model.matrix(~., data = X.mvlm)[,-1]
X.dum <- as.data.frame(X.dum)

# Use these reformatted data in MMR
mvlm.res.dum <- mvlm(Y ~ ., data = X.dum)
summary(mvlm.res.dum)

# --- Interaction Model --- #

# Get dummy-codes for the categorical predictor using the first group as a
# reference category, and then remove the leading column of 1's
X.dum.int <- model.matrix(~.^2, data = X.mvlm)[,-1]
X.dum.int <- as.data.frame(X.dum.int)

# Use these reformatted data in MMR
mvlm.res.dum.int <- mvlm(Y ~ ., data = X.dum.int)
summary(mvlm.res.dum.int)

## ---- message = F--------------------------------------------------------
Y.hat <- fitted(mvlm.res)
Y.resid <- residuals(mvlm.res)

## ---- message = F--------------------------------------------------------
round(cor(X.dum, Y.hat), 4)
round(cor(X.dum, Y.resid), 4)

## ---- message = F, fig.width = 6.5, fig.height = 4.333-------------------
# Split the data  - one part to build the model, the other to predict
X.train <- X.mvlm[1:150,]
Y.train <- as.matrix(Y.mvlm[1:150,])
X.test <- X.mvlm[151:200,]
Y.test <- as.matrix(Y.mvlm[151:200,])

# Fit the model to the training set
mvlm.res.pred <- mvlm(Y.train ~ ., data = X.train)

# Get predictions
Y.test.pred <- predict(mvlm.res.pred, newdata = X.test)

# Plot the predicted values vs. the true values in the test set
par(mfrow = c(2,3))
for(k in 1:5){
  plot(Y.test.pred[,k], Y.test[,k], main = paste("Outcome Variable", k),
       xlab = 'Predicted Value', ylab = 'Observed Value')
}

