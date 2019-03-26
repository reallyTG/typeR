library(DCGL)


### Name: qLinkfilter
### Title: Filter gene coexpression links according to the q-values of
###   expression correlation values
### Aliases: qLinkfilter
### Keywords: link filtering

### ** Examples

data(exprs)
qLinkfilter(exprs[1:100,1:16],exprs[1:100,17:63],
	cutoff=0.25,
	r.method='pearson',
	q.method='BH')



