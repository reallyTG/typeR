library(SimTimeVar)


### Name: make_one_linear_pred
### Title: Generate linear predictor from logistic model
### Aliases: make_one_linear_pred

### ** Examples

# take part of parameters matrix corresponding to single level of categorical
#  variable
m = cat.params[ cat.params$level == "black", ]
data = data.frame( male = rbinom(n=10, size=1, prob=0.5) )
make_one_linear_pred(m, data)



