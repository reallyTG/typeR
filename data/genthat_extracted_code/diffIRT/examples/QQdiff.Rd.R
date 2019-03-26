library(diffIRT)


### Name: QQdiff
### Title: Assessing diffIRT model fit for the response times using
###   QQ-plots
### Aliases: QQdiff
### Keywords: models multivariate

### ** Examples

## Not run: 
##D # open rotation data
##D data(rotation)
##D x=rotation[,1:10]
##D rt=rotation[,11:20]
##D  
##D # fit an unconstrained Q-diffusion model
##D res1=diffIRT(rt,x,model="Q")           
##D 
##D # make QQ-plots and histograms for items 1 to 4.
##D QQdiff(res1, items=1:4, plot=2, maxRT=rep(50,4))
## End(Not run)  



