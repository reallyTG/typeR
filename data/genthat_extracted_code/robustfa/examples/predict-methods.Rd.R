library(robustfa)


### Name: predict-methods
### Title: Calculates prediction
### Aliases: predict-methods predict,Fa-method predict
### Keywords: methods

### ** Examples


data("hbk")
hbk.x = hbk[,1:3] 

faCovPcaRegMcd = FaCov(x = hbk.x, factors = 2, method = "pca",
scoresMethod = "regression", cov.control = CovControlMcd()); faCovPcaRegMcd

## If missing newdata, the scores are used
predict(faCovPcaRegMcd)

##
## If not missing newdata, newdata should be scaled first.
##
newdata = hbk.x[1, ]
cor = FALSE # the default
newdata = { 
if (cor == TRUE)
	# standardized transformation
	scale(newdata, center = faCovPcaRegMcd@center, 
	scale = sqrt(diag(faCovPcaRegMcd@covariance)))
else # cor == FALSE
	# centralized transformation
	scale(newdata, center = faCovPcaRegMcd@center, scale = FALSE)
}

##
## Now, prediction = predict(faCovPcaRegMcd)[1,] = faCovPcaRegMcd@scores[1,]
##
prediction = predict(faCovPcaRegMcd, newdata = newdata)
prediction




