library(EvoRAG)


### Name: bootstrap.test
### Title: Estimate confidence intervals using bootstrap
### Aliases: bootstrap.test
### Keywords: bootstrap

### ** Examples

## Not run: 
##D ###EXAMPLE 1
##D 
##D   ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=100, min = 0, max = 10)
##D   GRAD = runif(n=100, min = 0, max = 60)
##D   DATA1 <- sim.sisters(TIME = TIME, GRAD=GRAD, parameters = c(2, -0.03), 
##D      model=c("BM_linear"))
##D 
##D   ###Find the MLE of model parameters
##D   RESULT <- model.test.sisters(DIST=DATA1[,3], TIME=DATA1[,2], 
##D      GRAD=DATA1[,1], models=c("BM_linear"))
##D   intercept <- as.numeric(RESULT[5,1])
##D   slope <- as.numeric(RESULT[6,1])
##D   model = c("BM_linear")
##D   parameters=c(intercept, slope)
##D 
##D   ###Run the bootstrap
##D   RR <- bootstrap.test(DIST=DATA1[,3], TIME=DATA1[,2],
##D      GRAD=DATA1[,1], model = "BM_linear", parameters, meserr1=0, 
##D 	 meserr2=0, N = c(100))
##D   summary <- RR$summary #to show only the summary. 
##D   bootstraps <- RR$bootstraps #to obtain the bootstraps
##D 
##D 
##D ###EXAMPLE 2
##D   ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=100, min = 0, max = 10)
##D   GRAD = runif(n=100, min = 0, max = 60)
##D   DATA1 <- sim.sisters(TIME = TIME, GRAD=GRAD, parameters = c(2, -0.03, 1, 
##D       0.1), model=c("OU_linear"))
##D   ###Find the MLE of model parameters
##D   RESULT <- model.test.sisters(DIST=DATA1[,3], TIME=DATA1[,2],    
##D      GRAD=DATA1[,1], models=c("OU_linear"))
##D   intercept_beta <- as.numeric(RESULT[5,1])
##D   slope_beta <- as.numeric(RESULT[7,1])
##D   intercept_alpha <- as.numeric(RESULT[11,1])
##D   slope_alpha <- as.numeric(RESULT[12,1])
##D   parameters=c(intercept_beta, slope_beta, intercept_alpha, slope_alpha)
##D 
##D   ###Run the bootstrap
##D   RR <- bootstrap.test(DIST=DATA1[,3], TIME=DATA1[,2], 
##D      GRAD=DATA1[,1], model = "OU_linear", parameters, meserr1=0, meserr2=0, 
##D      N = c(100))
##D   summary <- RR$summary #to show only the summary. 
##D   bootstraps <- RR$bootstraps #to obtain the bootstraps
##D  
## End(Not run)#end dontrun



