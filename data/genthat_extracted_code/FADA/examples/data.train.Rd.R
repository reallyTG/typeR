library(FADA)


### Name: data.train
### Title: Training data
### Aliases: data.train

### ** Examples

data(data.train)
dim(data.train$x) # 30 250
data.train$y # 2 levels
hist(cor(data.train$x[data.train$y==1,])) # high dependence 
hist(cor(data.train$x[data.train$y==2,]))



