## ----eval=FALSE----------------------------------------------------------
#  install.packages("SDEFSR")

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github('aklxao2/SDEFSR')

## ----eval=FALSE----------------------------------------------------------
#  irisFromKEEL <- read.dataset("iris.dat")
#  irisFromARFF <- read.dataset("iris.arff")
#  irisFromCSV <- read.dataset("iris.csv")

## ----highlight=TRUE------------------------------------------------------
library(SDEFSR)
df <- data.frame(matrix(data = runif(1000), ncol = 10))
#Add class attribute (It must be the last attribute and it must be categorical)
df[,11] <- c("Class 0", "Class 1", "Class 2", "Class 3")
SDEFSR_DatasetObject <- SDEFSR_DatasetFromDataFrame(df, relation = "random")
#Load from iris dataset
irisFromDataFrame <- SDEFSR_DatasetFromDataFrame(iris, "iris")

## ----highlight=TRUE------------------------------------------------------
summary(irisFromDataFrame)

## ----highlight=TRUE------------------------------------------------------
irisFromDataFrame$nVars
irisFromDataFrame$attributeNames

## ----eval=FALSE----------------------------------------------------------
#  > ruleSet <- MESDIF(paramFile = "param.txt")

## ----eval=TRUE,highlight=TRUE--------------------------------------------
ruleSet <- MESDIF(paramFile = NULL, 
                  training = irisFromDataFrame, 
                  test = NULL,
                  output = c("optionsFile.txt", "rulesFile.txt", "testQM.txt"),
                  seed = 0,
                  nLabels = 3,
                  nEval = 300,
                  popLength = 100,
                  eliteLength = 2,
                  crossProb = 0.6,
                  mutProb = 0.01,
                  RulesRep = "can",
                  Obj1 = "CSUP",
                  Obj2 = "CCNF",
                  Obj3 = "null",
                  Obj4 = "null",
                  targetVariable = "Species",
                  targetClass = "virginica")

## ----highlight=FALSE-----------------------------------------------------
library(ggplot2)
plotRules(ruleSet)

## ----eval=FALSE----------------------------------------------------------
#  	rulesOrderedBySignificance <- orderRules(ruleSet, by = "Significance")

## ----eval=TRUE-----------------------------------------------------------
#Apply filter by unusualness
filteredRules <- ruleSet[Unusualness > 0.05]
#We check only if the number of rules decrease.
#In this case, this value must be 1.
length(filteredRules)


#Also, you can make the filter as complex as you can
#Filter by Unusualness, TPr and number of variables:
filteredRules <- ruleSet[Unusualness > 0.05 & TPr > 0.9 & nVars == 3]
#In this case, any of the rules match the conditions. Therefore, the
#number of rules must be 0.
length(filteredRules) 

## ----eval=FALSE----------------------------------------------------------
#  SDR_GUI()

