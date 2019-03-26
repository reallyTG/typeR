library(varhandle)


### Name: inspect.na
### Title: inspect matrix or data.frame regarding NAs
### Aliases: inspect.na
### Keywords: NA missing locate inspect summary

### ** Examples

    # get some data
    my_iris <- iris
    # add 20 NAs randomly
    for(i in 1:260){
        my_iris[sample(1:nrow(my_iris), 2), sample(c(1,2,3,1,3,3,3), 1)] <- NA
    }

    # now we can inspect the NAs
    inspect.na(my_iris)
    # plot the histogram
    inspect.na(my_iris, hist=TRUE, barplot=FALSE)



