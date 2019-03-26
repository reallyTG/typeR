library(randomUniformForest)


### Name: update.unsupervised
### Title: Update Unsupervised Learning object
### Aliases: update.unsupervised update
### Keywords: unsupervised learning clustering dimension reduction

### ** Examples

## not run
## Water Treatment Plant Data Set
## Data can be download at https://archive.ics.uci.edu/ml/datasets/Water+Treatment+Plant

# URL = "http://archive.ics.uci.edu/ml/machine-learning-databases/water-treatment/"
# dataset = "water-treatment.data"

# X = read.table(paste(URL, dataset, sep= ""), sep = ",")

## 1- Preprocessing
## first, look at the first column and format date
#  Dates = rm.string(as.character(X[,1]), "D-")
#  DatesAsStringTable = do.call(rbind, strsplit(Dates, "/"))
#  DatesasNumericTable = t(apply(DatesAsStringTable, 1, as.numeric))

##  Then, transform data as a pure R matrix and add new dates
#  XX = as.true.matrix(X)[,-1]
#  XX = cbind(DatesasNumericTable, XX)
#  colnames(XX)[1:3] = c("day", "month", "year")

# Look the new data
# head(XX)
# str(XX)

## and fill missing values,
# X.imputed = fillNA2.randomUniformForest(XX)

## 2 - run unsupervised analysis on the first half of dataset 
# subset.1 = 1:floor(nrow(X.imputed)/2)
# WaterTreatment.model.1 = unsupervised.randomUniformForest(X.imputed, subset = subset.1, 
# baseModel = "proximityThenDistance",  seed = 2014)

## assess roughly the model and visualize
#  WaterTreatment.model.1

## 3 - update model with the second half of dataset
# WaterTreatment.updated = update.unsupervised(WaterTreatment.model.1, 
# X.imputed[-subset.1,], oldData = X.imputed[subset.1,])

# WaterTreatment.updated

## view how MDS points have been learned :
## first component
# WaterTreatment.updated$largeDataLearningModel[[1]]

## second component
# WaterTreatment.updated$largeDataLearningModel[[2]]



