library(mice)


### Name: bwplot.mids
### Title: Box-and-whisker plot of observed and imputed data
### Aliases: bwplot.mids bwplot
### Keywords: hplot

### ** Examples


imp <- mice(boys, maxit=1)

### box-and-whisker plot per imputation of all numerical variables
bwplot(imp)

### tv (testicular volume), conditional on region
bwplot(imp, tv~.imp|reg)

### same data, organized in a different way 
bwplot(imp, tv~reg|.imp, theme=list())






