library(nlsmsn)


### Name: Oil
### Title: Oil palm yield
### Aliases: Oil
### Keywords: datasets

### ** Examples

## Not run: 
##D ##Load the data
##D data(Oil)
##D 
##D ##Define non linear function
##D nlf<-function(x,betas){
##D resp<- betas[1]/(1 +betas[2]*exp(-betas[3]*x))
##D return(resp)
##D }
##D 
##D ##Set the response y and covariate x
##D y <- Oil$y
##D x <- Oil$x
##D 
##D ##Set initial values
##D betas <- c(37,4.81,0.78)
##D sigma2 <- 2.95
##D shape <- -2
##D nu <- 3
##D 
##D ## Skew.normal regression
##D analysis.sn <- smsn.nl(y=y, x=x, betas=betas, sigma2=sigma2, 
##D                        shape = shape, nlf = nlf, criteria = TRUE, 
##D                        family = "Skew.normal", iter.max = 200)
##D 
##D ## Skew.t regression
##D analysis.st <- smsn.nl(y=y, x=x, betas=betas, sigma2=sigma2, shape = shape, 
##D                        nu = nu, nlf = nlf, criteria = TRUE, 
##D                        family = "Skew.t", iter.max = 200)
## End(Not run)



