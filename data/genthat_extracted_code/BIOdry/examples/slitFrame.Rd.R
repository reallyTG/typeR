library(BIOdry)


### Name: slitFrame
### Title: Multilevel splitting
### Aliases: slitFrame

### ** Examples

##Ring data frame:
##Multilevel data frame of tree-ring widths:
data(Prings05, envir = environment())
data(PTclim05, envir = environment())
## split multilevel data into its second factor-level column:
spl <- slitFrame(Prings05)
str(spl)
## split the data into the factor-level: 'year':
spl <- slitFrame(Prings05,'year')
str(spl)
spl <- slitFrame(PTclim05,'year')
str(spl)




