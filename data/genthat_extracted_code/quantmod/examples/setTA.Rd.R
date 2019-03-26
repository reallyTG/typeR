library(quantmod)


### Name: setTA
### Title: Manage TA Argument Lists
### Aliases: setTA unsetTA listTA
### Keywords: utilities

### ** Examples

## Not run: 
##D listTA()
##D setTA()
##D 
##D # a longer way to accomplish the same
##D setDefaults(chartSeries,TA=listTA())
##D setDefaults(barCart,TA=listTA())
##D setDefaults(candleChart,TA=listTA())
##D 
##D setDefaults(chartSeries,TA=substitute(c(addVo(),addBBands())))
## End(Not run)



