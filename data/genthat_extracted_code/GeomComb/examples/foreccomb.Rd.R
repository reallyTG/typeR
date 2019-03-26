library(GeomComb)


### Name: foreccomb
### Title: Format Raw Data for Forecast Combination
### Aliases: foreccomb
### Keywords: manip

### ** Examples

obs <- rnorm(100)
preds <- matrix(rnorm(1000, 1), 100, 10)
train_o<-obs[1:80]
train_p<-preds[1:80,]
test_o<-obs[81:100]
test_p<-preds[81:100,]

## Example with a training set only:
foreccomb(train_o, train_p)

## Example with a training set and future individual forecasts:
foreccomb(train_o, train_p, newpreds=test_p)

## Example with a training set and a full test set:
foreccomb(train_o, train_p, test_o, test_p)

## Example with forecast models being stored in rows:
preds_row <- matrix(rnorm(1000, 1), 10, 100)
train_p_row <- preds_row[,1:80]
foreccomb(train_o, train_p_row, byrow = TRUE)

## Example with NA imputation:
train_p_na <- train_p
train_p_na[2,3] <- NA
foreccomb(train_o, train_p_na, na.impute = TRUE)

## Example with perfect collinearity:
train_p[,2] <- 0.8*train_p[,1] + 0.4*train_p[,8]
foreccomb(train_o, train_p, criterion="RMSE")




