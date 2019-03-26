library(diffIRT)


### Name: RespFit
### Title: Assessing diffIRT model fit for the responses using limited
###   information goodness-of-fit testing.
### Aliases: RespFit
### Keywords: models multivariate

### ** Examples

## Not run: 
##D  # open extraversion data
##D data(extraversion)
##D x=extraversion[,1:10]
##D rt=extraversion[,11:20]
##D  
##D # fit an unconstrained D-diffusion model
##D res1=diffIRT(rt,x,model="D")          
##D 
##D # Conduct the limited-information test
##D RespFit(res1, 2)
## End(Not run)  



