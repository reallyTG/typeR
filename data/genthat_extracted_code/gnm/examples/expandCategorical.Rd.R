library(gnm)


### Name: expandCategorical
### Title: Expand Data Frame by Re-expressing Categorical Data as Counts
### Aliases: expandCategorical
### Keywords: manip models

### ** Examples

### Example from help(multinom, package = "nnet")
library(MASS)
example(birthwt)
library(nnet)
bwt.mu <- multinom(low ~ ., data = bwt)

## Equivalent using gnm - include unestimable main effects in model so 
## that interactions with low0 automatically set to zero, else could use
## 'constrain' argument. 
bwtLong <- expandCategorical(bwt, "low", group = FALSE)
bwt.po <- gnm(count ~  low*(. - id), eliminate = id, data = bwtLong, family =
              "poisson") 
summary(bwt.po) # same deviance; df reflect extra id parameters

### Example from ?backPain
set.seed(1)
summary(backPain)
backPainLong <- expandCategorical(backPain, "pain")

## Fit models described in Table 5 of Anderson (1984)

noRelationship <- gnm(count ~ pain, eliminate = id,
                      family = "poisson", data = backPainLong)

oneDimensional <- update(noRelationship,
                         ~ . + Mult(pain, x1 + x2 + x3))



