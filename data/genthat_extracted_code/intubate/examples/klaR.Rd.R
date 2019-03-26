library(intubate)


### Name: klaR
### Title: Interfaces for klaR package for data science pipelines.
### Aliases: ntbt_classscatter ntbt_cond.index ntbt_greedy.wilks
###   ntbt_loclda ntbt_meclight ntbt_NaiveBayes ntbt_nm ntbt_partimat
###   ntbt_plineplot ntbt_pvs ntbt_rda ntbt_sknn ntbt_stepclass ntbt_woe
###   classscatter cond.index greedy.wilks loclda meclight NaiveBayes nm
###   partimat plineplot pvs rda sknn stepclass woe
### Keywords: intubate magrittr klaR

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(klaR)
##D 
##D ## ntbt_classscatter: Classification scatterplot matrix
##D data(B3)
##D library(MASS)
##D 
##D ## Original function to interface
##D classscatter(PHASEN ~ BSP91JW + EWAJW + LSTKJW, data = B3, method = "lda")
##D 
##D ## The interface puts data as first parameter
##D ntbt_classscatter(B3, PHASEN ~ BSP91JW + EWAJW + LSTKJW, method = "lda")
##D 
##D ## so it can be used easily in a pipeline.
##D B3 %>%
##D   ntbt_classscatter(PHASEN ~ BSP91JW + EWAJW + LSTKJW, method = "lda")
##D 
##D 
##D ## ntbt_cond.index: Calculation of Condition Indices for Linear Regression
##D data(Boston)
##D 
##D ## Original function to interface
##D cond.index(medv ~ ., data = Boston)
##D 
##D ## The interface puts data as first parameter
##D ntbt_cond.index(Boston, medv ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D Boston %>%
##D   ntbt_cond.index(medv ~ .)
##D 
##D 
##D ## ntbt_greedy.wilks: Stepwise forward variable selection for classification
##D data(B3)
##D 
##D ## Original function to interface
##D greedy.wilks(PHASEN ~ ., data = B3, niveau = 0.1)
##D 
##D ## The interface puts data as first parameter
##D ntbt_greedy.wilks(B3, PHASEN ~ ., niveau = 0.1)
##D 
##D ## so it can be used easily in a pipeline.
##D B3 %>%
##D   ntbt_greedy.wilks(PHASEN ~ ., niveau = 0.1)
##D 
##D ## ntbt_loclda: Localized Linear Discriminant Analysis (LocLDA)
##D ## Original function to interface
##D loclda(PHASEN ~ ., data = B3)
##D 
##D ## The interface puts data as first parameter
##D ntbt_loclda(B3, PHASEN ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D B3 %>%
##D   ntbt_loclda(PHASEN ~ .)
##D 
##D 
##D ## ntbt_meclight: Minimal Error Classification
##D data(iris)
##D 
##D ## Original function to interface
##D meclight(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_meclight(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_meclight(Species ~ .)
##D 
##D 
##D ## ntbt_NaiveBayes: Naive Bayes Classifier
##D data(iris)
##D 
##D ## Original function to interface
##D NaiveBayes(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_NaiveBayes(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_NaiveBayes(Species ~ .)
##D 
##D 
##D ## ntbt_nm: Nearest Mean Classification
##D ## Original function to interface
##D nm(PHASEN ~ ., data = B3)
##D 
##D ## The interface puts data as first parameter
##D ntbt_nm(B3, PHASEN ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D B3 %>%
##D   ntbt_nm(PHASEN ~ .)
##D 
##D 
##D ## ntbt_partimat: Plotting the 2-d partitions of classification methods
##D ## Original function to interface
##D partimat(Species ~ ., data = iris, method = "lda")
##D 
##D ## The interface puts data as first parameter
##D ntbt_partimat(iris, Species ~ ., method = "lda")
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_partimat(Species ~ ., method = "lda")
##D 
##D 
##D ## ntbt_plineplot: Plotting marginal posterior class probabilities
##D ## Original function to interface
##D plineplot(PHASEN ~ ., data = B3, method = "lda", x = "EWAJW", xlab = "EWAJW")
##D 
##D ## The interface puts data as first parameter
##D ntbt_plineplot(B3, PHASEN ~ ., method = "lda", x = "EWAJW", xlab = "EWAJW")
##D 
##D ## so it can be used easily in a pipeline.
##D B3 %>%
##D   ntbt_plineplot(PHASEN ~ ., method = "lda", x = "EWAJW", xlab = "EWAJW")
##D 
##D 
##D ## ntbt_pvs: Pairwise variable selection for classification
##D library("mlbench")
##D data("Satellite")
##D 
##D ## Original function to interface
##D pvs(classes ~ ., Satellite[1:3218,], method="qda", vs.method="ks.test")
##D 
##D ## The interface puts data as first parameter
##D ntbt_pvs(Satellite[1:3218,], classes ~ ., method="qda", vs.method="ks.test")
##D 
##D ## so it can be used easily in a pipeline.
##D Satellite[1:3218,] %>%
##D   ntbt_pvs(classes ~ ., method="qda", vs.method="ks.test")
##D 
##D 
##D ## ntbt_rda: Regularized Discriminant Analysis (RDA)
##D ## Original function to interface
##D rda(Species ~ ., data = iris, gamma = 0.05, lambda = 0.2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_rda(iris, Species ~ ., gamma = 0.05, lambda = 0.2)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_rda(Species ~ ., gamma = 0.05, lambda = 0.2)
##D 
##D 
##D ## ntbt_sknn: Simple k nearest Neighbours
##D ## Original function to interface
##D sknn(Species ~ ., data = iris)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sknn(iris, Species ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_sknn(Species ~ .)
##D 
##D 
##D ## ntbt_stepclass: Stepwise variable selection for classification
##D ## Original function to interface
##D stepclass(Species ~ ., data = iris, method = "qda", 
##D           start.vars = "Sepal.Width", criterion = "AS")  # same as above 
##D 
##D ## The interface puts data as first parameter
##D ntbt_stepclass(iris, Species ~ ., method = "qda", 
##D                start.vars = "Sepal.Width", criterion = "AS")  # same as above 
##D 
##D ## so it can be used easily in a pipeline.
##D iris %>%
##D   ntbt_stepclass(Species ~ ., method = "qda", 
##D                  start.vars = "Sepal.Width", criterion = "AS")  # same as above 
##D 
##D 
##D ## ntbt_woe: Weights of evidence
##D data("GermanCredit")
##D set.seed(6)
##D train <- sample(nrow(GermanCredit), round(0.6*nrow(GermanCredit)))
##D 
##D ## Original function to interface
##D woe(credit_risk ~ ., data = GermanCredit[train,], zeroadj = 0.5, applyontrain = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_woe(GermanCredit[train,], credit_risk ~ ., zeroadj = 0.5, applyontrain = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D GermanCredit[train,] %>%
##D   ntbt_woe(credit_risk ~ ., zeroadj = 0.5, applyontrain = TRUE)
## End(Not run)



