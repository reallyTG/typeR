library(stylo)


### Name: perform.naivebayes
### Title: Naive Bayes classifier
### Aliases: perform.naivebayes

### ** Examples

## Not run: 
##D perform.naivebayes(training.set, test.set)
## End(Not run)

# classifying the standard 'iris' dataset:
data(iris)
x = subset(iris, select = -Species)
train = rbind(x[1:25,], x[51:75,], x[101:125,])
test = rbind(x[26:50,], x[76:100,], x[126:150,])
train.classes = c(rep("s",25), rep("c",25), rep("v",25))
test.classes = c(rep("s",25), rep("c",25), rep("v",25))

perform.knn(train, test, train.classes, test.classes)



