library(corkscrew)


### Name: apply.ctoc
### Title: Applying Categorical to Continuous conversion to a new dataframe
### Aliases: apply.ctoc
### Keywords: ~misc

### ** Examples

data(ChickWeight)
set.seed(2)
sample_ex <- sample(nrow(ChickWeight), size = 289, replace = FALSE, prob = NULL)
train <- ChickWeight[sample_ex,]
test <- ChickWeight[-sample_ex,colnames(ChickWeight) != "weight"]
# Returns the test dataframe with an added column "Diet_cont" by extrapolating it from train
head(apply.ctoc(y = "weight", "Diet", data = train, newdata = test, min.obs = 60))



