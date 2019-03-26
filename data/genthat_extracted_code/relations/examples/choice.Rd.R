library(relations)


### Name: choice
### Title: Relation-Based Choices
### Aliases: relation_choice
### Keywords: math

### ** Examples

data("SVM_Benchmarking_Classification")
## Determine the three best classification learners in the above sense.
relation_choice(SVM_Benchmarking_Classification, k = 3)



