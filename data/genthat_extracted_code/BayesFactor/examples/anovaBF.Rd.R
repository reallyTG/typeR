library(BayesFactor)


### Name: anovaBF
### Title: Function to compute Bayes factors for ANOVA designs
### Aliases: anovaBF
### Keywords: htest

### ** Examples

## Classical example, taken from t.test() example
## Student's sleep data
data(sleep)
plot(extra ~ group, data = sleep)

## traditional ANOVA gives a p value of 0.00283
summary(aov(extra ~ group + Error(ID/group), data = sleep))

## Gives a Bayes factor of about 11.6
## in favor of the alternative hypothesis
anovaBF(extra ~ group + ID, data = sleep, whichRandom = "ID",
    progress=FALSE)

## Demonstrate top-down testing
data(puzzles)
result = anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID",
    whichModels = 'top', progress=FALSE)
result

## In orthogonal designs, the top down Bayes factor can be
## interpreted as a test of the omitted effect



