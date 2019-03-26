library(RWeka)


### Name: evaluate_Weka_classifier
### Title: Model Statistics for R/Weka Classifiers
### Aliases: evaluate_Weka_classifier
### Keywords: models

### ** Examples

## Use some example data.
w <- read.arff(system.file("arff","weather.nominal.arff", 
	       package = "RWeka"))

## Identify a decision tree.
m <- J48(play~., data = w)
m

## Use 10 fold cross-validation.
e <- evaluate_Weka_classifier(m,
                              cost = matrix(c(0,2,1,0), ncol = 2),
                              numFolds = 10, complexity = TRUE,
                              seed = 123, class = TRUE)
e
summary(e)
e$details



