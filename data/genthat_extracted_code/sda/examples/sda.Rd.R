library(sda)


### Name: sda
### Title: Shrinkage Discriminant Analysis 2: Training Step
### Aliases: sda
### Keywords: multivariate

### ** Examples

# load sda library
library("sda")

########################## 
# training and test data #
##########################

# data set containing the SRBCT samples
get.srbct = function()
{
  data(khan2001)
  idx = which( khan2001$y == "non-SRBCT" )
  x = khan2001$x[-idx,]
  y = factor(khan2001$y[-idx])
  descr = khan2001$descr[-idx]

  list(x=x, y=y, descr=descr)
}
srbct = get.srbct()

# training data
Xtrain = srbct$x[1:63,]
Ytrain = srbct$y[1:63]
Xtest = srbct$x[64:83,]
Ytest = srbct$y[64:83]


###################################################
# classification with correlation (shrinkage LDA) #
###################################################

sda.fit = sda(Xtrain, Ytrain)
ynew = predict(sda.fit, Xtest)$class # using all 2308 features
sum(ynew != Ytest) 

###########################################################
# classification with diagonal covariance (shrinkage DDA) #
###########################################################

sda.fit = sda(Xtrain, Ytrain, diagonal=TRUE)
ynew = predict(sda.fit, Xtest)$class # using all 2308 features
sum(ynew != Ytest) 

#################################################################
# for complete example scripts illustrating classification with #
# feature selection visit http://strimmerlab.org/software/sda/  #
#################################################################



