library(RNetLogo)


### Name: NLDfToList
### Title: Transforms a data.frame into a NetLogo list or multiple NetLogo
###   lists (one for each column of the data.frame).
### Aliases: NLDfToList
### Keywords: interface NLDfToList RNetLogo

### ** Examples

## Not run: 
##D NLStart("C:/Program Files/NetLogo 6.0/app")
##D df1 <- data.frame(x=c(1,2,3,4),y=c(5,6,7,8))
##D # the current NetLogo model must have two variables ('x' and 'y')
##D # add the variables
##D NLSourceFromString("globals [x y]", append.model=FALSE)
##D # set the variables to the data.frame
##D NLDfToList(df1)
## End(Not run)



