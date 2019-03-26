library(som.nn)


### Name: predict,SOMnn-method
### Title: predict method for S4 class 'SOMnn'
### Aliases: predict,SOMnn-method

### ** Examples

## get example data and add class labels:
data(iris)
species <- iris$Species

## train with default radius = diagonal / 2:
som <- som.nn.train(iris, class.col = "Species", 
                    xdim = 15, ydim = 9, alpha = 0.02, len = 10000, 
                    norm = TRUE, toroidal = FALSE)

## predict some samples:
unk <- iris[,!(names(iris) %in% "Species")]

setosa <- unk[species=="setosa",]
setosa <- setosa[sample(nrow(setosa), 20),]

versicolor <- unk[species=="versicolor",]
versicolor <- versicolor[sample(nrow(versicolor), 20),]

virginica <- unk[species=="virginica",]
virginica <- virginica[sample(nrow(virginica), 20),]

## predict with generic function:
predict(som, unk)

## predict with function in SOMnn object:
som@predict(setosa)
som@predict(versicolor)
som@predict(virginica)

## get mapping with visual:
som.nn.visual(som@codes, setosa)


## change parameters of k-NN classifier:
som.nn.set(som, iris, dist.fun = dist.fun.bubble, max.dist = 3.1)
som.nn.set(som, iris, dist.fun = dist.fun.tricubic, max.dist = 3)

## define custom distance function:
som <- som.nn.set(som, iris, dist.fun = function(x, sigma){
            ifelse(x < sigma, dnorm(x, sd = sigma), 0)}, 
            max.dist = 3)

predict(som, setosa)
som





