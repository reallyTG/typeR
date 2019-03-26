library(intubate)


### Name: RWeka
### Title: Interfaces for RWeka package for data science pipelines.
### Aliases: ntbt_AdaBoostM1 ntbt_Bagging ntbt_CostSensitiveClassifier
###   ntbt_DecisionStump ntbt_Discretize ntbt_GainRatioAttributeEval
###   ntbt_IBk ntbt_InfoGainAttributeEval ntbt_J48 ntbt_JRip ntbt_LBR
###   ntbt_LogitBoost ntbt_LinearRegression ntbt_LMT ntbt_Logistic ntbt_M5P
###   ntbt_M5Rules ntbt_MultiBoostAB ntbt_Normalize ntbt_OneR ntbt_PART
###   ntbt_SMO ntbt_Stacking
### Keywords: intubate magrittr RWeka AdaBoostM1 Bagging
###   CostSensitiveClassifier DecisionStump Discretize
###   GainRatioAttributeEval IBk InfoGainAttributeEval J48 JRip LBR
###   LogitBoost LinearRegression LMT Logistic M5P M5Rules MultiBoostAB
###   Normalize OneR PART SMO Stacking

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(RWeka)
##D 
##D ## R/Weka Attribute Evaluators
##D ## Original function to interface
##D GainRatioAttributeEval(Species ~ . , data = iris)
##D InfoGainAttributeEval(Species ~ . , data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_GainRatioAttributeEval(iris, Species ~ .)
##D ntbt_InfoGainAttributeEval(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_GainRatioAttributeEval(Species ~ .)
##D iris %>%
##D   ntbt_InfoGainAttributeEval(Species ~ .)
##D 
##D ## R/Weka Classifier Functions
##D data(infert)
##D infert$STATUS <- factor(infert$case, labels = c("control", "case"))
##D 
##D ## Original function to interface
##D LinearRegression(weight ~ feed, data = chickwts)
##D Logistic(STATUS ~ spontaneous + induced, data = infert)
##D SMO(Species ~ ., data = iris, control = Weka_control(K = list("RBFKernel", G = 2)))
##D 
##D ## The interface puts data as first parameter
##D ntbt_LinearRegression(chickwts, weight ~ feed)
##D ntbt_Logistic(infert, STATUS ~ spontaneous + induced)
##D ntbt_SMO(iris, Species ~ ., control = Weka_control(K = list("RBFKernel", G = 2)))
##D 
##D ## so it can be used easily in a pipeline.
##D chickwts %>%
##D   ntbt_LinearRegression(weight ~ feed)
##D infert %>%
##D   ntbt_Logistic(STATUS ~ spontaneous + induced)
##D iris %>%
##D   ntbt_SMO(Species ~ ., control = Weka_control(K = list("RBFKernel", G = 2)))
##D 
##D ## R/Weka Lazy Learners
##D ## No examples provided. LBR seems to need 'lazyBayesianRules'
##D ## and I am too lazy myself to install it
##D ntbt_IBk(chickwts, weight ~ feed)   ## Example may not make sense
##D 
##D 
##D ## R/Weka Meta Learners
##D ## MultiBoostAB needs Weka package 'multiBoostAB'
##D ## CostSensitiveClassifier throws an error
##D 
##D ## Original function to interface
##D AdaBoostM1(Species ~ ., data = iris, control = Weka_control(W = "DecisionStump"))
##D Bagging(Species ~ ., data = iris, control = Weka_control())
##D LogitBoost(Species ~ ., data = iris, control = Weka_control())
##D Stacking(Species ~ ., data = iris, control = Weka_control())
##D 
##D ## The interface puts data as first parameter
##D ntbt_AdaBoostM1(iris, Species ~ ., control = Weka_control(W = "DecisionStump"))
##D ntbt_Bagging(iris, Species ~ ., control = Weka_control())
##D ntbt_LogitBoost(iris, Species ~ ., control = Weka_control())
##D ntbt_Stacking(iris, Species ~ ., control = Weka_control())
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_AdaBoostM1(Species ~ ., control = Weka_control(W = "DecisionStump"))
##D iris %>%
##D   ntbt_Bagging(Species ~ ., control = Weka_control())
##D iris %>%
##D   ntbt_LogitBoost(Species ~ ., control = Weka_control())
##D iris %>%
##D   ntbt_Stacking(Species ~ ., control = Weka_control())
##D 
##D ## R/Weka Rule Learners
##D ## Original function to interface
##D JRip(Species ~ ., data = iris)
##D M5Rules(mpg ~ ., data = mtcars)
##D OneR(Species ~ ., data = iris)
##D PART(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_JRip(iris, Species ~ .)
##D ntbt_M5Rules(mtcars, mpg ~ .)
##D ntbt_OneR(iris, Species ~ .)
##D ntbt_PART(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_JRip(Species ~ .)
##D mtcars %>%
##D   ntbt_M5Rules(mpg ~ .)
##D iris %>%
##D   ntbt_OneR(Species ~ .)
##D iris %>%
##D   ntbt_PART(Species ~ .)
##D 
##D ## R/Weka Classifier Trees
##D DF3 <- read.arff(system.file("arff", "cpu.arff", package = "RWeka"))
##D DF4 <- read.arff(system.file("arff", "weather.arff", package = "RWeka"))
##D 
##D ## Original function to interface
##D DecisionStump(play ~ ., data = DF4)
##D J48(Species ~ ., data = iris)
##D LMT(play ~ ., data = DF4)
##D M5P(class ~ ., data = DF3)
##D 
##D ## The interface puts data as first parameter
##D ntbt_DecisionStump(DF4, play ~ .)
##D ntbt_J48(iris, Species ~ .)
##D ntbt_LMT(DF4, play ~ .)
##D ntbt_M5P(DF3, class ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D DF4 %>%
##D   ntbt_DecisionStump(play ~ .)
##D iris %>%
##D   ntbt_J48(Species ~ .)
##D DF4 %>%
##D   ntbt_LMT(play ~ .)
##D DF3 %>%
##D   ntbt_M5P(class ~ .)
##D 
##D ## R/Weka Filters
##D w <- read.arff(system.file("arff","weather.arff", package = "RWeka"))
##D 
##D ## Original function to interface
##D Discretize(play ~., data = w)
##D Normalize(~., data = w)
##D 
##D ## The interface puts data as first parameter
##D ntbt_Discretize(w, play ~.)
##D ntbt_Normalize(w, ~.)
##D 
##D ## so it can be used easily in a pipeline.
##D w %>%
##D   ntbt_Discretize(play ~.)
##D w %>%
##D   ntbt_Normalize(~.)
## End(Not run)



