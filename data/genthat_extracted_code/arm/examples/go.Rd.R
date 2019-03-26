library(arm)


### Name: GO
### Title: Function to Recall Last Source File
### Aliases: GO-class go G
### Keywords: methods manip

### ** Examples

    go('myprog')            # will run source('myprog.r')
    go()                    # will run source('myprog.r') again
    go('somelib',add=TRUE)  # will run source('myprog.r') and source('somelib.r')
    go('myprog','somelib')  # same as above
    go('mytest')            # will run source('mytest') only
    go()                    # runs source('mytest') again
    G                       # short cut to call go()
 


