## ------------------------------------------------------------------------
library("utiml")

## ------------------------------------------------------------------------
head(toyml)

## ------------------------------------------------------------------------
foodtruck$labels

## ------------------------------------------------------------------------
mytoy <- normalize_mldata(toyml)

## ------------------------------------------------------------------------
ds <- create_holdout_partition(mytoy, c(train=0.65, test=0.35), "iterative")
names(ds)

## ------------------------------------------------------------------------
brmodel <- br(ds$train, "RF", seed=123)
prediction <- predict(brmodel, ds$test)

## ------------------------------------------------------------------------
head(as.bipartition(prediction))
head(as.probability(prediction))
head(as.ranking(prediction))

## ------------------------------------------------------------------------
newpred <- rcut_threshold(prediction, 2)
head(newpred)

## ------------------------------------------------------------------------
result <- multilabel_evaluate(ds$tes, prediction, "bipartition")
thresres <- multilabel_evaluate(ds$tes, newpred, "bipartition")

round(cbind(Default=result, RCUT=thresres), 3)

## ------------------------------------------------------------------------
result <- multilabel_evaluate(ds$tes, prediction, "bipartition", labels=TRUE)
result$labels

## ------------------------------------------------------------------------
results <- cv(foodtruck, br, base.algorith="SVM", cv.folds=5, 
              cv.sampling="stratified", cv.measures="example-based", 
              cv.seed=123)

round(results, 4)

## ------------------------------------------------------------------------
results <- cv(toyml, "rakel", base.algorith="RF", cv.folds=10, cv.results=TRUE,
              cv.sampling="random", cv.measures="example-based")

#Multi-label results
round(results$multilabel, 4)

#Labels results
round(sapply(results$labels, colMeans), 4)

## ---- echo=FALSE, results='asis'-----------------------------------------
bl <- data.frame(
  Use = c("CART", "C5.0", "J48", "KNN", "MAJORITY", "NB", "RANDOM", "RF", "SVM"),
  Name = c("Classification and regression trees", "C5.0 Decision Trees and Rule-Based Models", "Java implementation of the C4.5", "K Nearest Neighbor", "Majority class prediction", "Naive Bayes", "Random prediction", "Random Forest", "Support Vector Machine"),
  Package = c("rpart", "C50", "RWeka and rJava", "kknn", "-", "e1071", "-", "randomForest", "e1071"),
  Call = c("rpart::rpart(...)", "C50::C5.0(...)", "RWeka::J48(...)", "kknn::kknn(...)", "-", "e1071::naiveBayes(...)", "-", "randomForest::randomForest(...)", "e1071::svm(...)")
)
knitr::kable(bl)

## ---- echo=FALSE, results='asis'-----------------------------------------
approaches <- c(
  "br"="one-against-all", "brplus"="one-against-all; stacking", "cc"="one-against-all; chaining", "clr"="one-versus-one", "ctrl"="one-against-all; ensemble", "dbr"="one-against-all; stacking", "ebr"="one-against-all; ensemble", "ecc"="one-against-all; ensemble", "eps"="powerset", "homer"="hierarchy", "lift"="one-against-all", "lp"="powerset", "mbr"="one-against-all; stacking", "ns"="one-against-all; chaining", "ppt"="powerset", "prudent"="one-against-all; stacking", "ps"="powerset", "rakel"="powerset", "rdbr"="one-against-all; stacking", "rpc"="one-versus-one"
)
mts <- data.frame(
  Method = c("br", "brplus", "cc", "clr", "ctrl", "dbr", "ebr", "ecc", "eps", "homer", "lift", "lp", "mbr", "ns", "ppt", "prudent", "ps", "rakel", "rdbr", "rpc"),
  Name = c("Binary Relevance (BR)", "BR+", "Classifier Chains", "Calibrated Label Ranking (CLR)", "ConTRolled Label correlation exploitation (CTRL)", "Dependent Binary Relevance (DBR)", "Ensemble of Binary Relevance (EBR)", "Ensemble of Classifier Chains (ECC)", "Ensemble of Pruned Set (EPS)", "Hierarchy Of Multi-label classifiER (HOMER)", "Learning with Label specIfic FeaTures (LIFT)", "Label Powerset (LP)", "Meta-Binary Relevance (MBR or 2BR)", "Nested Stacking (NS)", "Pruned Problem Transformation (PPT)", "Pruned and Confident Stacking Approach (Prudent)", "Pruned Set (PS)", "Random k-labelsets (RAkEL)", "Recursive Dependent Binary Relevance (RDBR)", "Ranking by Pairwise Comparison (RPC)"),
  Approach = as.character(approaches)
)
knitr::kable(mts)

## ------------------------------------------------------------------------
toy <- create_holdout_partition(toyml)
brmodel <- br(toy$train, "SVM")
prediction <- predict(brmodel, toy$test)

# Using the test dataset and the prediction
result <- multilabel_evaluate(toy$test, prediction)
print(round(result, 3))

# Build a confusion matrix
confmat <- multilabel_confusion_matrix(toy$test, prediction)
result <- multilabel_evaluate(confmat)
print(confmat)

## ------------------------------------------------------------------------
# Example-based measures
result <- multilabel_evaluate(confmat, "example-based")
print(names(result))

# Subset accuracy, F1 measure and hamming-loss
result <- multilabel_evaluate(confmat, c("subset-accuracy", "F1", "hamming-loss"))
print(names(result))

# Ranking and label-basedd measures
result <- multilabel_evaluate(confmat, c("label-based", "ranking"))
print(names(result))

# To see all the supported measures you can try
multilabel_measures()

## ---- echo=FALSE, results='asis'-----------------------------------------
## 8. How to extend utiml

### 8.1 Create a new Multi-label Method

### 8.2 Create a new base Learner

