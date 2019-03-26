library(varhandle)


### Name: unfactor
### Title: Convert factor into appropriate class
### Aliases: unfactor
### Keywords: unfactor defactor

### ** Examples

    # load a dataframe (from base package)
    data(iris)
    
    # see the actual values of the categorical column
    class(iris$Species)
    
    # use vactor as input
    species <- unfactor(iris$Species)
    # check the class
    class(species)
    
    # use data.frame as input
    my_iris <- data.frame(Sepal.Length=factor(iris$Sepal.Length), sample_id=factor(1:nrow(iris)))
    my_iris <- unfactor(my_iris)
    # check the class
    class(my_iris)
    class(my_iris$Sepal.Length)
    class(my_iris$sample_id)



