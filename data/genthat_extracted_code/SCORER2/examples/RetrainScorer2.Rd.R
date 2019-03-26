library(SCORER2)


### Name: RetrainScorer2
### Title: Retrain the SCORER 2.0 algorithm with user-defined training data
### Aliases: RetrainScorer2

### ** Examples

# load training data
data(training)
seq <- training[, 1]
reg <- training[, 2]
type <- training[, 3]

# retrain SCORER 2.0 to obtain new pssm
pssm <- RetrainScorer2(seq, reg, type)



