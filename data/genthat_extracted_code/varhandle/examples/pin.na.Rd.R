library(varhandle)


### Name: pin.na
### Title: Pinpoint NAs in a vector, matrix or data.frame
### Aliases: pin.na
### Keywords: NA missing locate pinpoint

### ** Examples

    ## generate some variables
    # create a vector
    var1 <- 1:30
    # add NA at random places
    var1[runif(7, 1, 30)] <- NA
    # pinpoint NAs
    pin.na(var1)
    
    # create a matrix
    var2 <- matrix(runif(100, 10, 99), nrow = 10)
    # add NA at random places
    var2[runif(9, 1, 100)] <- NA
    # pinpoint NAs
    pin.na(var2)
    
    ## define your own missing values:
    var2[runif(5, 1, 100)] <- "."
    pin.na(var2, na.value = c(NA, "."))





