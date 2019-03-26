library(Hmisc)


### Name: getRs
### Title: Interact with github rscripts Project
### Aliases: getRs
### Keywords: interface

### ** Examples

## Not run: 
##D getRs()             # list available scripts
##D scripts <- getRs()  # likewise, but store in an object that can easily
##D                     # be viewed on demand in RStudio
##D getRs('introda.r')  # download introda.r and put in script editor
##D getRs(cats=TRUE)    # list available major and minor categories
##D categories <- getRs(cats=TRUE)
##D # likewise but store results in a list for later viewing
##D getRs(cats='reg')   # list all scripts in a major category containing 'reg'
##D getRs('importREDCap.r', put='source')   # source() to define a function
##D # source() a new version of the Hmisc package's cut2 function:
##D getRs('cut2.s', grepo='Hmisc', dir='R', put='source')
## End(Not run)



