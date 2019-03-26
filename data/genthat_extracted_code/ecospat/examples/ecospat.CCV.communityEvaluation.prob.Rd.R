library(ecospat)


### Name: ecospat.CCV.communityEvaluation.prob
### Title: Evaluates community predictions directly on the probabilities
###   (i.e., threshold independent)
### Aliases: ecospat.CCV.communityEvaluation.prob
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #Loading species occurence data and remove empty communities
##D data(ecospat.testData)
##D testData <- ecospat.testData[,c(24,34,43,45,48,53,55:58,60:63,65:66,68:71)]
##D sp.data <- testData[which(rowSums(testData)>0), sort(colnames(testData))]
##D 
##D #Loading environmental data
##D env.data <- ecospat.testData[which(rowSums(testData)>0),4:8]
##D 
##D #Coordinates for all sites
##D xy <- ecospat.testData[which(rowSums(testData)>0),2:3]
##D 
##D #Running all the models for all species
##D myCCV.Models <- ecospat.CCV.modeling(sp.data = sp.data,
##D                                      env.data = env.data,
##D                                      xy = xy,
##D                                      NbRunEval = 5,
##D                                      minNbPredictors = 10,
##D                                      VarImport = 3)
##D                                      
##D #Calculating the probabilistic community metrics
##D myCCV.communityEvaluation.prob <- ecospat.CCV.communityEvaluation.prob(
##D       ccv.modeling.data = myCCV.Models,
##D       community.metrics = c('SR.deviation','community.AUC','probabilistic.Sorensen'),
##D       se.th = 0.02, 
##D       parallel = FALSE,
##D       cpus = 4)
## End(Not run)



