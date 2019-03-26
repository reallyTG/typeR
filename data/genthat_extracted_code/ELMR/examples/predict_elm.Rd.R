library(ELMR)


### Name: predict_elm
### Title: Prediction function for the ELM model generated with the
###   elm_training() function
### Aliases: predict_elm

### ** Examples

x = runif(100, 0, 50)
y = sqrt(x)
train = data.frame(y,x)
train = data.frame(preProcess(train))
model = OSelm_train.formula(y~x, train, "regression", 100, "hardlim", 10, 10)
#' x = runif(100, 0, 50)
y = sqrt(x)
test = data.frame(y,x)
test = data.frame(preProcess(train))
accuracy = predict_elm(model, test)



