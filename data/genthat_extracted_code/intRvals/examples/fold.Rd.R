library(intRvals)


### Name: fold
### Title: Folds observed arrival intervals to a fundamental interval
### Aliases: fold

### ** Examples

dr=estinterval(goosedrop$interval,group=goosedrop$bout_id)
# fold assuming no within-group variation:
interval.fundamental=fold(dr)
# test whether there is evidence for within-group variation:
partition(dr)$`p<alpha`   #> TRUE
# there is evidence, therefore better to fold
# while accounting for within-group variation:
interval.fundamental=fold(dr,sigma.within='auto')



