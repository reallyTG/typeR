library(DCGL)


### Name: percentLinkfilter
### Title: Filter gene coexpression links according to the top percent of
###   expression correlation coefficient value
### Aliases: percentLinkfilter
### Keywords: link filtering

### ** Examples

data(exprs)
percentLinkfilter(exprs[1:100,1:16],exprs[1:100,17:63],cutoff=0.25,r.method='pearson')



