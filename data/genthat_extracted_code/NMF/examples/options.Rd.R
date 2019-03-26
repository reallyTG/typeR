library(NMF)


### Name: options-NMF
### Title: NMF Package Specific Options
### Aliases: nmf.getOption nmf.options nmf.printOptions nmf.resetOptions
###   options-NMF

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# show all NMF specific options
nmf.printOptions()

# get some options
nmf.getOption('verbose')
nmf.getOption('pbackend')
# set new values
nmf.options(verbose=TRUE)
nmf.options(pbackend='mc', default.algorithm='lee')
nmf.printOptions()

# reset to default
nmf.resetOptions()
nmf.printOptions()



