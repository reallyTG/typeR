library(PBSmodelling)


### Name: getChoice
### Title: Choose One String Item from a List of Choices
### Aliases: getChoice
### Keywords: device utilities

### ** Examples

## Not run: 
##D #-- Example 1
##D local(envir=.PBSmodEnv,expr={
##D   getChoice(c("Fame","Fortune","Health","Beauty","Lunch"),
##D     "What do you want?",qcolor="red",gui=FALSE)
##D })
##D 
##D #-- Example 2
##D local(envir=.PBSmodEnv,expr={
##D   getChoice(c("Homer Simpson","Wilberforce Humphries","Miss Marple","Gary Numan"),
##D     "Who`s your idol?",horiz=FALSE,radio=TRUE,gui=FALSE)
##D })
## End(Not run)



