library(DCGL)


### Name: rLinkfilter
### Title: Filter gene coexpression links according to correlation
###   coefficient value
### Aliases: rLinkfilter
### Keywords: link filtering

### ** Examples

data(exprs)
rLinkfilter(exprs[1:100,1:16],exprs[1:100,17:63],cutoff=0.8,r.method='pearson')



