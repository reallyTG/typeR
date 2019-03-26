library(CCM)


### Name: create.CCM
### Title: Creates a CCM correlation matrix
### Aliases: create.CCM
### Keywords: methods

### ** Examples


data(data.expr)
data(data.gender)

## split dataset into training / testing ##
train.expr = data.expr[,1:20]
test.expr = data.expr[,21:40]
train.gender = data.gender[1:20]
test.gender = data.gender[21:40]

## CCM using spearman correlation ##
K = create.CCM(test.expr, train.expr, method = "spearman")
## predict based on the class with the highest mean correlation (the default) ##
p = predict(K, train.gender)
table(pred = p, true = test.gender) # check accuracy

## CCM using pearson correlation ##
K = create.CCM(test.expr, train.expr, method = "pearson")
## predict based on the class with the maximum correlation 
p = predict(K, train.gender, func = max)
table(pred = p, true = test.gender) # check accuracy

### leave-one-out cross validation on entire dataset ###
K = create.CCM(data.expr, method = "spearman")
p = predict(K, data.gender)
table(pred = p, true = data.gender) # check accuracy



