library(qkerntool)


### Name: qtSNE-class
### Title: Class "qtSNE"
### Aliases: qtSNE-class dimRed,qtSNE-method dimRed<-,qtSNE-method

### ** Examples
## Not run: 
##D #use iris data set
##D data(iris)
##D testset <- sample(1:150,20)
##D train <- as.matrix(iris[,1:4])
##D 
##D colors = rainbow(length(unique(iris$Species)))
##D names(colors) = unique(iris$Species)
##D #for matrix
##D ecb = function(x,y){
##D   plot(x,t='n');
##D   text(x,labels=iris$Species, col=colors[iris$Species])
##D }
##D kpc2 <- qtSNE(train, kernel = "rbfbase", qpar = list(sigma=1,q=0.8),
##D               epoch_callback = ecb, perplexity=10, max_iter = 500)
##D 
##D #cndernf
##D cndkernf(kpc2)
##D 
##D #dimRed
##D plot(dimRed(kpc2),col=train)
##D 
## End(Not run)



