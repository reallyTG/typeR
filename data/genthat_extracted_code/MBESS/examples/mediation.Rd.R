library(MBESS)


### Name: mediation
### Title: Effect sizes and confidence intervals in a mediation model
### Aliases: mediation
### Keywords: multivariate

### ** Examples

## Not run: 
##D ############################################
##D # EXAMPLE 1
##D # Using the Jessor data discussed in Preacher and Kelley (2011), to illustrate
##D # the methods based on summary statistics. 
##D  
##D mediation(S=rbind(c(2.26831107,  0.6615415, -0.08691755), 
##D c(0.66154147,  2.2763549, -0.22593820), c(-0.08691755, -0.2259382,  0.09218055)), 
##D N=432, x.location.S=1, mediator.location.S=2, dv.location.S=3, mean.x=7.157645, 
##D mean.m=5.892785, mean.dv=1.649316, conf.level=.95)
##D 
##D ############################################
##D # EXAMPLE 2
##D # Clear the workspace:
##D rm(list=ls(all=TRUE))
##D 
##D # An (unrealistic) example data (from Hayes) 
##D Data <- rbind(
##D   c(-5.00, 25.00, -1.00),
##D   c(-4.00, 16.00, 2.00),
##D   c(-3.00, 9.00, 3.00),
##D   c(-2.00, 4.00, 4.00),
##D   c(-1.00, 1.00, 5.00),
##D   c(.00, .00, 6.00),
##D   c(1.00, 1.00, 7.00),
##D   c(2.00, 4.00, 8.00),
##D   c(3.00, 9.00, 9.00),
##D   c(4.00, 16.00, 10.00),
##D   c(5.00, 25.00, 13.00),
##D   c(-5.00, 25.00, -1.00),
##D   c(-4.00, 16.00, 2.00),
##D   c(-3.00, 9.00, 3.00),
##D   c(-2.00, 4.00, 4.00),
##D   c(-1.00, 1.00, 5.00),
##D   c(.00, .00, 6.00),
##D   c(1.00, 1.00, 7.00),
##D   c(2.00, 4.00, 8.00),
##D   c(3.00, 9.00, 9.00),
##D   c(4.00, 16.00, 10.00),
##D   c(5.00, 25.00, 13.00))
##D 
##D 
##D # Raw data example of the Hayes data.
##D mediation(x=Data[,1], mediator=Data[,2], dv=Data[,3], conf.level=.95)
##D 
##D # Sufficient statistics example of the Hayes data.
##D mediation(S=var(Data), N=22, x.location.S=1, mediator.location.S=2, dv.location.S=3, 
##D mean.x=mean(Data[,1]), mean.m=mean(Data[,2]), mean.dv=mean(Data[,3]), conf.level=.95)
##D 
##D # Example had there been two groups. 
##D gp.size <- length(Data[,1])/2 # adjust if using an odd number of observations.
##D grouping.variable <- c(rep(0, gp.size), rep(1, gp.size))
##D mediation(x=grouping.variable, mediator=Data[,2], dv=Data[,3])
##D 
##D ############################################
##D # EXAMPLE 3
##D # Bootstrap of continuous data. 
##D set.seed(12414) # Seed used for repeatability (there is nothing special about this seed)
##D bs.Results <- mediation(x=Data[,1], mediator=Data[,2], dv=Data[,3], 
##D bootstrap=TRUE, B=5000, save.bs.replicates=TRUE)
##D 
##D ls() # Notice that Bootstrap.Replicates is available in the 
##D workspace (if save.bs.replicates=TRUE in the above call). 
##D 
##D #Now, given the Bootstrap.Replicates object, one can do whatever they want with them. 
##D 
##D # See the names of the effect sizes (and their ordering)
##D colnames(Bootstrap.Replicates)
##D 
##D # Define IE as the indirect effect from the Bootstrap.Replicates object. 
##D IE <- Bootstrap.Replicates$Indirect.Effect
##D 
##D # Summary statistics
##D mean(IE)
##D median(IE)
##D sqrt(var(IE))
##D 
##D # CIs from percentile perspective
##D quantile(IE, probs=c(.025, .975))
##D 
##D # Two-sided p-value. 
##D ## First, calculate obseved value of the indirect effect and extract it here. 
##D IE.Observed <- mediation(x=Data[,1], mediator=Data[,2], dv=Data[,3], 
##D conf.level=.95)$Effect.Sizes[1,]
##D 
##D ## Now, find those values of the bootstrap indirect effects that are more extreme (in an absolute 
##D ## sense) than the indirect effect observed. Note that the p-value is 1 here because the observed
##D ## indirect effect is exactly 0. 
##D mean(abs(IE) >= abs(IE.Observed))
## End(Not run)



