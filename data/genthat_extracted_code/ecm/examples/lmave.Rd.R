library(ecm)


### Name: lmave
### Title: Build multiple lm models and average them
### Aliases: lmave

### ** Examples

##Not run

#Build linear models to predict Wilshire 5000 index based on corporate profits, 
#Federal Reserve funds rate, and unemployment rate
data(Wilshire)

#Build one model on the entire dataset
modelall <- lm(Wilshire5000 ~ ., data = Wilshire)

#Build a five fold averaged linear model on the entire dataset
modelave <- lmave('Wilshire5000 ~ .', data = Wilshire, k = 5) 




