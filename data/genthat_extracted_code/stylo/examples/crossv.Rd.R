library(stylo)


### Name: crossv
### Title: Function to Perform Cross-Validation
### Aliases: crossv

### ** Examples

## Not run: 
##D crossv(training.set, test.set)
## End(Not run)

# classifying the standard 'iris' dataset:
data(iris)
x = subset(iris, select = -Species)
train = rbind(x[1:25,], x[51:75,], x[101:125,])
test = rbind(x[26:50,], x[76:100,], x[126:150,])
train.classes = c(rep("s",25), rep("c",25), rep("v",25))
test.classes = c(rep("s",25), rep("c",25), rep("v",25))

crossv(train, test, cv.mode = "stratified", cv.folds = 10, 
       train.classes, test.classes)


# text categorization

# specity a table with frequencies:
data(galbraith)
freqs = galbraith

# specify class labels:
training.texts = c("coben_breaker", "coben_dropshot", "lewis_battle", 
                   "lewis_caspian", "rowling_casual", "rowling_chamber", 
                   "tolkien_lord1", "tolkien_lord2")
train.classes = match(training.texts,rownames(freqs))

# select the training samples:
training.set = freqs[train.classes,]

# select remaining rows as test samples:
test.set = freqs[-train.classes,]

crossv(training.set, test.set)



