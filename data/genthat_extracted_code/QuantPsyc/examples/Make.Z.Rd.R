library(QuantPsyc)


### Name: Make.Z
### Title: Standardize Data
### Aliases: Make.Z
### Keywords: univar multivariate

### ** Examples


zUSJR <- Make.Z(USJudgeRatings)	# creates new object containg z scores
dim(zUSJR)			# shows that there are 43 observed z scores for 12 variables
zUSJR[,1]			# to look at only the first column of z scores




