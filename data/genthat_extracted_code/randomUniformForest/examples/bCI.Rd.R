library(randomUniformForest)


### Name: bCI
### Title: Bootstrapped Prediction Intervals for Ensemble Models
### Aliases: bCI

### ** Examples

# n = 100;  p = 10
# Simulate 'p' gaussian vectors with random parameters between -10 and 10.
# X <- simulationData(n,p)

## make a rule to create response vector
# epsilon1 = runif(n,-1,1)
# epsilon2 = runif(n,-1,1)
# Y = 2*(X[,1]*X[,2] + X[,3]*X[,4]) + epsilon1*X[,5] + epsilon2*X[,6]

## suppose Y has many zeros and a reduced scale
# Y[Y <= mean(Y)] = 0
# Y[Y > 0] = Y[Y > 0]/100

## randomize and make train and test sample
# twoSamples <- cut(sample(1:n,n), 2, labels = FALSE)

# Xtrain = X[which(twoSamples == 1),]
# Ytrain = Y[which(twoSamples == 1)]
# Xtest = X[which(twoSamples == 2),]
# Ytest = Y[which(twoSamples == 2)]

## compute a model and predict
## NOTE : in regression, the model uses subsampling
# rUF.model <- randomUniformForest(Xtrain, Ytrain, bagging = TRUE, logX = TRUE, 
# ntree = 50, threads = 1, OOB = FALSE)

######### PART ONE : get classical predictions intervals

## CLASSIC PREDICTION INTERVALS by random Uniform Forest :
## get 99% predictions interval by the standard predictions interval of the model
# rUF.ClassicPredictionsInterval <- predict(rUF.model, Xtest, type = "confInt", conf = 0.99)

## check mean squared error
# sum((rUF.ClassicPredictionsInterval$Estimate - Ytest)^2)/length(Ytest)

## PROBABILITY (estimate) OF BEING OUT OF THE BOUNDS OF PREDICTION INTERVALS 
## using all test sample, meaning that we compute the probability that any response 
## goes outside its predicted interval when assessing the test set

# outsideConfIntLevels(rUF.ClassicPredictionsInterval, Ytest, conf = 0.99)

## get average of prediction intervals (we will assess it against the one derived
## in the second part)
# mean(abs(rUF.ClassicPredictionsInterval[,3] - rUF.ClassicPredictionsInterval[,2]))

######### PART TWO : get bootstrapped predictions intervals

## BOOTSTRAPPED PREDICTION INTERVALS by random Uniform Forest :
##  get all votes
# rUF.predictionsVotes <- predict(rUF.model, Xtest, type = "votes")

##  get 99% predictions interval by bCI:
# bCI.predictionsInterval <- bCI(rUF.predictionsVotes, conf = 0.99, R = 100, threads = 1)

## since we know that lower bound can not be lower than 0, we set it explicitly 
## (it is already the case in standard prediction interval)
# bCI.predictionsInterval[bCI.predictionsInterval[,2] < 0, 2] = 0 
 
##  PROBABILITY (estimate) OF BEING OUT OF THE BOUNDS OF PREDICTION INTERVALS 
## (bounds are expected to be, at most, slightly worst than in the standard case)
# outsideConfIntLevels(bCI.predictionsInterval, Ytest, conf = 0.99)

##  get average of prediction intervals 
## (expected to be much tighter than the standard one)
# mean(abs(bCI.predictionsInterval[,3] - bCI.predictionsInterval[,2]))

######### PART THREE : COMPARISON OF CONFIDENCE INTERVALS

## CONFIDENCE INTERVAL FOR THE EXPECTATION OF Y: 
## mean of Y
# mean(Ytest)

## estimate of confidence interval by bCI:
# colMeans(bCI.predictionsInterval[,2:3])

## estimate by standard confidence interval:
# colMeans(rUF.ClassicPredictionsInterval[,2:3])

## using bCI(), get closer confidence interval for expectation of Y, at the expense
## of realistic prediction intervals:
## get 99% predictions interval by bCI, assuming very tight bounds
# bCI.UnrealisticPredictionsInterval <- bCI(rUF.predictionsVotes, 
# conf = 0.99, R = 200, largeValues = FALSE, threads = 1)
										
##  assess it 
## (we do not want predictions interval...)
# outsideConfIntLevels(bCI.UnrealisticPredictionsInterval, Ytest, conf = 0.99)

## get (bayesian?) mean and confidence interval for the expectation of Y 
## (...but we want good confidence interval)
# colMeans(bCI.UnrealisticPredictionsInterval) 

## much closer than the standard one, with almost the same mean
# colMeans(rUF.ClassicPredictionsInterval)

######## PART FOUR : A REAL CASE

#### Regression : "Concrete Compressive Strength" data 
## (http://archive.ics.uci.edu/ml/datasets/Concrete+Compressive+Strength)

# data(ConcreteCompressiveStrength)
# ConcreteCompressiveStrength.data = ConcreteCompressiveStrength

# n <- nrow(ConcreteCompressiveStrength.data)
# p <- ncol(ConcreteCompressiveStrength.data)

# set.seed(2014)
# trainTestIdx <- cut(sample(1:n, n), 2, labels= FALSE)

## train examples
# Concrete.data.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, -p]
# Concrete.responses.train <- ConcreteCompressiveStrength.data[trainTestIdx == 1, p]

## model
# Concrete.ruf <- randomUniformForest(Concrete.data.train, Concrete.responses.train, 
# threads = 2)
# Concrete.ruf

## get test data
# Concrete.data.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, -p]
# Concrete.responses.test <- ConcreteCompressiveStrength.data[trainTestIdx == 2, p]

## assessing predictions intervals :

## 1- with the OOB classifier, what can we expect from the bounds 
## when going toward the test set :

## first, compute the prediction intervals of the OOB classifier
# OOBpredictionIntervals = bCI(Concrete.ruf$forest$OOB.votes, conf = 0.95)

## main interest: how could we rely on the OOB evaluation to get useful informations
## about what we will predict when going toward the test set
# outsideConfIntLevels(OOBpredictionIntervals, Concrete.responses.train, conf = 0.95)

## 2- so, we know now that our 95% confidence interval must be tempered
## when giving estimates for the test set: in other words, the confidence level we ask
## will probably not be the one we will get from the test set.
## Let us ask for prediction intervals from the forest classifier:

# predictionIntervals = bCI(predict(Concrete.ruf, Concrete.data.test, type= "votes"))

## a- main interest: after getting the test responses we can now look, if the OOB classifier
## was right, i.e. out-of-bounds probabilities for the test set with the forest classifier 
## should see their sum being over 5% and close to (the sum of) the OOB ones
##(but this latter would probably require more trees than the default value we let)
# outsideConfIntLevels(predictionIntervals, Concrete.responses.test, conf = 0.95)

## b- let us now look to the confidence interval for the mean of test responses:
## two arguments here : the forest classifier has no bias (under the i.i.d assumption);
## average of prediction intervals lead to confidence interval for the true mean

# colMeans(predictionIntervals)

## comparing to the true mean
# mean(Concrete.responses.test)

## and to the one of the standard case of the forest classifier
# colMeans(predict(Concrete.ruf, Concrete.data.test, type= "confInt", conf= 0.95))




