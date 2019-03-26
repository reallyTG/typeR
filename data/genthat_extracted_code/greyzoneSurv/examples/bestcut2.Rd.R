library(greyzoneSurv)


### Name: bestcut2
### Title: Find an Optimal Cutoff for the 2-group Model
### Aliases: bestcut2

### ** Examples

## Use the package data "mydata" to fit the 2-group model
data(mydata)
res=bestcut2(data=mydata, stime='time', sind='event', var='x')
table(res[,'bestcut2'])

#compare the true groupings and that from the 2-group model
table(res[,c('xhigh', 'bestcut2')]) 




