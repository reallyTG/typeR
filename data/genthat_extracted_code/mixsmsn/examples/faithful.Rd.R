library(mixsmsn)


### Name: faithful
### Title: Old Faithful Geyser Data
### Aliases: faithful
### Keywords: datasets

### ** Examples

## Not run: 
##D data(faithful)
##D 
##D ## Maximum likelihood estimaton (MLE) for the multivariate FM-SMSN distribution
##D ## with generated values
##D ## Normal
##D Norm.analysis <- smsn.mmix(faithful, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Normal")
##D mix.contour(faithful,Norm.analysis,x.min=1,x.max=1,y.min=15,y.max=10,
##D             levels = c(0.1, 0.015, 0.005, 0.0009, 0.00015))
##D 
##D ## Calculate the information matrix (when the calc.im option in smsn.mmix is set FALSE)
##D Norm.im <-  imm.smsn(faithful, Norm.analysis)
##D 
##D ## Skew-Normal
##D Snorm.analysis <- smsn.mmix(faithful, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Skew.normal")
##D mix.contour(faithful,Snorm.analysis,x.min=1,x.max=1,y.min=15,y.max=10,
##D             levels = c(0.1, 0.015, 0.005, 0.0009, 0.00015))
##D 
##D ## Calculate the information matrix (when the calc.im option in smsn.mmix is set FALSE)
##D Snorm.im <-  imm.smsn(faithful, Snorm.analysis)
##D 
##D ## Skew-t
##D St.analysis <- smsn.mmix(faithful, nu=3, g=2, get.init = TRUE, criteria = TRUE, 
##D                            group = TRUE, family = "Skew.t")
##D mix.contour(faithful,St.analysis,x.min=1,x.max=1,y.min=15,y.max=10,
##D             levels = c(0.1, 0.015, 0.005, 0.0009, 0.00015))
##D 
##D ## Calculate the information matrix (when the calc.im option in smsn.mmix is set FALSE)
##D St.im <-  imm.smsn(faithful, St.analysis)
##D 
##D ## Passing initial values to MLE and automaticaly calculate the information matrix
##D mu1 <- c(5,77)
##D Sigma1 <- matrix(c(0.18,0.60,0.60,41), 2,2)
##D shape1 <- c(0.69,0.64)
##D 
##D mu2 <- c(2,52)
##D Sigma2 <- matrix(c(0.15,1.15,1.15,40), 2,2)
##D shape2 <- c(4.3,2.7)
##D 
##D pii<-c(0.65,0.35)
##D 
##D mu <- list(mu1,mu2)
##D Sigma <- list(Sigma1,Sigma2)
##D shape <- list(shape1,shape2)
##D 
##D Snorm.analysis <- smsn.mmix(faithful, nu=3, mu=mu, Sigma=Sigma, shape=shape, pii=pii,
##D                             g=2, get.init = FALSE, group = TRUE,
##D                             family = "Skew.normal", calc.im=TRUE)
##D                             
##D mix.contour(faithful,Snorm.analysis,x.min=1,x.max=1,y.min=15,y.max=10,
##D             levels = c(0.1, 0.015, 0.005, 0.0009, 0.00015))
##D 
##D ## Search for the best number of clusters from g=1 to g=3
##D faithful.analysis <- smsn.search(faithful, nu = 3, g.min = 1, g.max=3)
##D mix.contour(faithful,faithful.analysis$best.model,x.min=1,x.max=1,
##D             y.min=15,y.max=10,levels = c(0.1, 0.015, 0.005, 0.0009,
##D             0.00015)) 
## End(Not run)



