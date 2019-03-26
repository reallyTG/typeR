library(varhandle)


### Name: var.info
### Title: Get a detailed list of variables
### Aliases: var.info
### Keywords: information size memory usage variable

### ** Examples

    ## generate some variables
    # a data.frame
    data(iris)
    # some character vector
    for(i in 1:5){
        assign(letters[i], paste("some random text:",
                                 paste0(letters[runif(5, 1, 26)],
                                 collapse="")))
    }
    # a list
    f <- lapply(5:10, function(x){paste("some random text:",
                                  paste0(letters[runif(5, 1, 26)],
                                  collapse=""))})


    # basic usage
    var.info()
    # the sorting
    var.info(sortby="name", decreasing=FALSE)




