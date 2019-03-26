library(ordinalForest)


### Name: ordinalForest-package
### Title: Ordinal Forests: Prediction and Variable Ranking with Ordinal
###   Target Variables
### Aliases: ordinalForest-package ordinalForest

### ** Examples

## Not run: 
##D # Illustration of the key functionalities of the package:
##D ##########################################################
##D 
##D # Load example dataset:
##D 
##D data(hearth)
##D 
##D # Inspect the data:
##D table(hearth$Class)
##D dim(hearth)
##D 
##D head(hearth) 
##D 
##D 
##D # Split into training dataset and test dataset:
##D 
##D set.seed(123)
##D trainind <- sort(sample(1:nrow(hearth), size=floor(nrow(hearth)*(2/3))))
##D testind <- setdiff(1:nrow(hearth), trainind)
##D 
##D datatrain <- hearth[trainind,]
##D datatest <- hearth[testind,]
##D 
##D 
##D # Construct OF prediction rule using the training dataset:
##D 
##D ordforres <- ordfor(depvar="Class", data=datatrain, nsets=1000, ntreeperdiv=100, 
##D   ntreefinal=5000, perffunction = "equal")
##D ordforres
##D 
##D # Study variable importance values:
##D sort(ordforres$varimp, decreasing=TRUE)
##D 
##D # Take a closer look at the top variables:
##D boxplot(datatrain$oldpeak ~ datatrain$Class, horizontal=TRUE)
##D fisher.test(table(datatrain$exang, datatrain$Class))
##D 
##D # Predict values of the ordinal target variable in the test dataset:
##D 
##D preds <- predict(ordforres, newdata=datatest)
##D preds
##D 
##D # Compare predicted values with true values:
##D table(data.frame(true_values=datatest$Class, predictions=preds$ypred))
## End(Not run) 




