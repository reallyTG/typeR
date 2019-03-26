library(expss)


### Name: default_dataset
### Title: Get or set reference to default dataset. Experimental feature.
### Aliases: default_dataset

### ** Examples


data(iris)
default_iris = iris
default_dataset(default_iris) # set default dataset

.compute({
    new_col = 1
    Sepal.Length = Sepal.Length*2 
})

# for comparison

iris$new_col = 1
iris$Sepal.Length = iris$Sepal.Length*2 
identical(iris, default_iris) # should be TRUE

default_dataset(NULL) # disable default dataset




