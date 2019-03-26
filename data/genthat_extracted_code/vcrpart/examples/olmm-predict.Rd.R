library(vcrpart)


### Name: olmm-predict
### Title: Predict outcome probabilities and responses for 'olmm' objects
### Aliases: olmm-predict fitted.olmm predict.olmm
### Keywords: methods

### ** Examples

## ------------------------------------------------------------------- #
## Example: Schizophrenia
## ------------------------------------------------------------------- #

data(schizo)

## omit subject 1103 and the last observations of 1104 and 1105 
subs <- c(1:4, 8, 11)

dat.train <- schizo[-subs, ] # training data
dat.valid <- schizo[ subs, ] # test data

## fit the model
model <- olmm(imps79o ~ tx + sqrt(week) + tx:sqrt(week) + re(1|id), dat.train)

## prediction on the predictor scale
## ---------------------------------

## random effects are set equal zero
predict(model, newdata = dat.valid, type = "link", ranef = FALSE)

## .. or equally with self-defined random effects
ranef <- matrix(0, 3, 1)
rownames(ranef) <- c("1103", "1104", "1105")
predict(model, newdata = dat.valid, type = "link", ranef = ranef)

## use random effects for the subjects 1104 and 1105. 
predict(model, newdata = dat.valid, type = "link", ranef = TRUE)

## prediction on the response scale
## --------------------------------

## use random effects for the subjects 1104 and 1105. 
predict(model, newdata = dat.valid, type = "response", ranef = FALSE)
predict(model, newdata = dat.valid, type = "prob", ranef = FALSE) # .. or, equally
predict(model, newdata = dat.valid, type = "class", ranef = FALSE)

## treat all individuals as new (subject vector is deleted)
predict(model, newdata = dat.valid[,-1], type = "response", ranef = FALSE)

## use random effects for the subjects 1104 and 1105. 
predict(model, newdata = dat.valid, type = "response", ranef = TRUE)

## use self defined random effects
ranef <- matrix(0, 3, 1)
rownames(ranef) <- c("1103", "1104", "1105")
predict(model, newdata = dat.valid, type = "response", ranef = ranef)

## predict random effects
## ----------------------

head(predict(model, type = "ranef"))
head(ranef(model)) # .. or, equally



