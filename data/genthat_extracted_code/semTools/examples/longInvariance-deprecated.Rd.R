library(semTools)


### Name: longInvariance-deprecated
### Title: Measurement Invariance Tests Within Person
### Aliases: longInvariance-deprecated
### Keywords: internal

### ** Examples


model <- ' f1t1 =~ y1t1 + y2t1 + y3t1
           f1t2 =~ y1t2 + y2t2 + y3t2
			      f1t3 =~ y1t3 + y2t3 + y3t3 '

## Create list of variables
var1 <- c("y1t1", "y2t1", "y3t1")
var2 <- c("y1t2", "y2t2", "y3t2")
var3 <- c("y1t3", "y2t3", "y3t3")
constrainedVar <- list(var1, var2, var3)

## Invariance of the same factor across timepoints
longInvariance(model, auto = 1, constrainAuto = TRUE,
               varList = constrainedVar, data = exLong)

## Invariance of the same factor across timepoints and groups
longInvariance(model, auto = 1, constrainAuto = TRUE,
               varList = constrainedVar, data = exLong, group = "sex",
	              group.equal = c("loadings", "intercepts"))




