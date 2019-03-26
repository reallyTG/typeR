library(ChainLadder)


### Name: tweedieReserve
### Title: Tweedie Stochastic Reserving Model
### Aliases: tweedieReserve
### Keywords: models

### ** Examples

## Not run: 
##D ## Verrall's ODP Model is a Tweedie with p=1, log link and 
##D ## origin/development periods as factors, thus c(1,1,0)
##D res1 <- tweedieReserve(MW2008, var.power=1, link.power=0, 
##D                            design.type=c(1,1,0), rereserving=TRUE,
##D                            progressBar=TRUE)
##D 
##D ## To get directly ultimate view and respective one year view 
##D ## at selected percentiles
##D summary(res1) 
##D 
##D #To get other interesting statistics
##D res1$summary
##D 
##D ## In order to validate the Tweedie parameter 'p', it is interesting to 
##D ## review its loglikelihood profile. Please note that, given the nature 
##D ## of our data, it is expected that we may have some fitting issues for 
##D ## given 'p' parameters, thus any results/errors should be considered 
##D ## only indicatively. Considering different regression structures is anyway 
##D ## recommended. Different 'p' values can be defined via the p.check array 
##D ## as input of the function. 
##D ## See help(tweedie.profile), p.vec parameter, for further information.
##D ## Note: The parameters rereserving and bootstrap can be set to 0 to speed up 
##D ## the process, as they aren't needed. 
##D 
##D ## Runs a 'p' loglikelihood profile on the parameters 
##D ## p=c(0,1.1,1.2,1.3,1.4,1.5,2,3)
##D res2 <- tweedieReserve(MW2008, p.optim=TRUE, 
##D                        p.check=c(0,1.1,1.2,1.3,1.4,1.5,2,3), 
##D                        design.type=c(1,1,0), 
##D                         rereserving=FALSE, bootstrap=0, 
##D                         progressBar=FALSE)
##D 
##D ## As it is possible to see in this example, the MLE of p (or xi) results 
##D ## between 0 and 1, which is not possible as Tweedie models aren't 
##D ## defined for 0 < p < 1, thus the Error message. 
##D ## But, despite this, we can conclude that overall the value p=1 could be 
##D ## reasonable for this dataset, as anyway it seems to be near the MLE. 
##D 
##D ## In order to consider an inflation parameter across the origin period, 
##D ## it may be interesting to change the regression structure to c(0,1,1) 
##D ## to get the same estimates of the Arithmetic Separation Method, as 
##D ## referred in Gigante/Sigalotti. 
##D res3 <- tweedieReserve(MW2008, var.power=1, link.power=0, 
##D                            design.type=c(0,1,1), rereserving=TRUE,
##D                            progressBar=TRUE)
##D res3
##D 
##D ## An assessment on future fitted calendar year values (usually defined 
##D ## as "gamma") is recommended
##D plot(res3$gamma_y)
##D 
##D ## Model residuals can be plotted using the res.diag output
##D plot(scaled.biasadj ~ dev, data=res3$res.diag) # Development year
##D plot(scaled.biasadj ~ cy, data=res3$res.diag) # Calendar year
##D plot(scaled.biasadj ~ origin, data=res3$res.diag) # Origin year
## End(Not run)



