library(treelet)


### Name: TCS
### Title: Treelet Covariance Smoothing
### Aliases: TCS

### ** Examples

data(Ahat)
out=Run_JTree(Ahat,49,49)
basis=out$basis[[49]]
cov=out$TreeCovs[[49]]

temp=TCS(basis,cov,.04)
#The value .04 above is arbitrary, and the user 
#should carefully select this value.  One approach
#is the subsampling method outlined in the Crossett et al
#arXiv paper.  The value in 'temp' is the smoothed estimate
#of the relationship matrix.




