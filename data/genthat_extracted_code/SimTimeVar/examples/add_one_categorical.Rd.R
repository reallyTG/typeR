library(SimTimeVar)


### Name: add_one_categorical
### Title: Generate linear predictor from logistic model
### Aliases: add_one_categorical

### ** Examples

# mini dataset with 3 observations per person
data = data.frame( male = rep( rbinom(n=10, size=1, prob=0.5), each=3 ) )
add_one_categorical( data, 10, 3, cat.params)



