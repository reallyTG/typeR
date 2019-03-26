library(mixsmsn)


### Name: bmi
### Title: Body Mass Index
### Aliases: bmi
### Keywords: datasets

### ** Examples

## Not run: 
##D data(bmi)
##D y <-bmi$bmi
##D 
##D hist(y,breaks=40)
##D 
##D ## Maximum likelihood estimaton (MLE) with generated values
##D bmi.analysis <- smsn.mix(y, nu = 3, g = 2, get.init = TRUE, criteria = TRUE, 
##D                          group = TRUE, calc.im=TRUE)
##D mix.hist(y,bmi.analysis)
##D 
##D ## Passing initial values to MLE
##D mu1 <- 20; mu2 <- 35
##D sigma2.1 <- 9; sigma2.2 <- 9;
##D lambda1 <- 0; lambda2 <- 0;
##D pii<- c(0.5,0.5)
##D 
##D mu <- c(mu1,mu2)
##D sigma2 <- c(sigma2.1,sigma2.2)
##D shape <- c(lambda1,lambda2)
##D 
##D bmi.analysis <- smsn.mix(y, nu = 3, mu, sigma2 , shape, pii, get.init = FALSE,
##D                          criteria = TRUE, group = TRUE, calc.im=FALSE)
##D mix.hist(y,bmi.analysis)
##D 
##D ## Calculate the information matrix (when the calc.im option in smsn.mix is set FALSE)
##D bmi.im <-  im.smsn(y, bmi.analysis)
##D 
##D ## Search for the best number of clusters from g=1 to g=5
##D bmi.analysis <- smsn.search(y, nu = 3, g.min = 1, g.max=5)
##D mix.hist(y,bmi.analysis$best.model)
## End(Not run)



