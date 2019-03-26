library(nlsmsn)


### Name: Ultrasonic
### Title: Ultrasonic Calibration
### Aliases: Ultrasonic
### Keywords: datasets

### ** Examples

## Not run: 
##D ##Load the data
##D data(Ultrasonic)
##D 
##D ##Define non linear function
##D nlf<-function(x,betas){
##D resp<- exp(-betas[1]*x)/(betas[2] + betas[3]*x)
##D return(resp)
##D }
##D 
##D ##Set the response y and covariate x
##D y <- Ultrasonic$y
##D x <- Ultrasonic$x
##D 
##D ##Set initial values
##D z <- x
##D betas <- c(0.1913, 0.0061, 0.0110)
##D rho <- -0.1
##D sigma2 <- 3.2726
##D shape <- 0.1698
##D nu <- 4
##D 
##D ## Skew.normal regression
##D analysis.sn <- smsn.nl(y = y, x = x, z = z, betas = betas, sigma2 = sigma2, shape = shape, 
##D                        rho = rho, nlf = nlf, rho.func = 2, reg.type = "Heteroscedastic", 
##D                        criteria = TRUE, family = "Skew.normal", iter.max = 200)
##D 
##D ## Skew.t regression
##D analysis.st <- smsn.nl(y = y, x = x, z = z, betas = betas, sigma2 = sigma2, shape = shape, nu = nu, 
##D                        rho = rho, nlf = nlf, rho.func = 1, reg.type = "He", 
##D                        criteria = TRUE, family = "Skew.t", iter.max = 200)
## End(Not run)



