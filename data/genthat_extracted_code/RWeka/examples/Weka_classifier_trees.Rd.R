library(RWeka)


### Name: Weka_classifier_trees
### Title: R/Weka Classifier Trees
### Aliases: Weka_classifier_trees J48 LMT M5P DecisionStump plot.Weka_tree
###   parse_Weka_digraph
### Keywords: models regression classif tree

### ** Examples

m1 <- J48(Species ~ ., data = iris)

## print and summary
m1
summary(m1) # calls evaluate_Weka_classifier()
table(iris$Species, predict(m1)) # by hand

## visualization
## use partykit package
if(require("partykit", quietly = TRUE)) plot(m1)
## or Graphviz
write_to_dot(m1)
## or Rgraphviz
## Not run: 
##D library("Rgraphviz")
##D ff <- tempfile()
##D write_to_dot(m1, ff)
##D plot(agread(ff))
## End(Not run)

## Using some Weka data sets ...

## J48
DF2 <- read.arff(system.file("arff", "contact-lenses.arff",
                             package = "RWeka"))
m2 <- J48(`contact-lenses` ~ ., data = DF2)
m2
table(DF2$`contact-lenses`, predict(m2))
if(require("partykit", quietly = TRUE)) plot(m2)

## M5P
DF3 <- read.arff(system.file("arff", "cpu.arff", package = "RWeka"))
m3 <- M5P(class ~ ., data = DF3)
m3
if(require("partykit", quietly = TRUE)) plot(m3)

## Logistic Model Tree.
DF4 <- read.arff(system.file("arff", "weather.arff", package = "RWeka"))
m4 <- LMT(play ~ ., data = DF4)
m4
table(DF4$play, predict(m4))

## Larger scale example.
if(require("mlbench", quietly = TRUE)
   && require("partykit", quietly = TRUE)) {
    ## Predict diabetes status for Pima Indian women
    data("PimaIndiansDiabetes", package = "mlbench")
    ## Fit J48 tree with reduced error pruning
    m5 <- J48(diabetes ~ ., data = PimaIndiansDiabetes,
              control = Weka_control(R = TRUE))
    plot(m5)
    ## (Make sure that the plotting device is big enough for the tree.)
}



