library(EvoRAG)


### Name: plotGradient.ci
### Title: Plot evolutionary rates and their confidence regions across a
###   gradient
### Aliases: plotGradient.ci
### Keywords: confidence interval, plot

### ** Examples

## Not run: 
##D   ###simulate data
##D   set.seed(seed = 3)
##D   TIME = runif(n=200, min = 0, max = 10)
##D   GRAD = runif(n=200, min = 0, max = 60)
##D   DATA1 <- sim.sisters(GRAD, TIME, parameters = c(0.1, 0.065), model=c("BM_linear"))
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
##D   ###Plot data
##D   plotGradient.ci(bootstraps1=bootstraps, 
##D      bootstraps2= c("FALSE"), Lmin=0, Lmax=60, ylim=c(0,10), 
##D      MLE=TRUE, MLE1=c(0.1, 0.065), MLE2=c(0,0), xlab="Latitude")
##D   
## End(Not run)#end dontrun



