library(sampleSelection)


### Name: Smoke
### Title: Survey Responses on Smoking Behaviour
### Aliases: Smoke
### Keywords: datasets

### ** Examples

data( Smoke )
# boundaries of the intervals
bounds <- c(0,5,10,20,50,Inf)
## Not run: 
##D # estimation with starting values obtained by a ML estimation 
##D # of a standard tobit-2 model with the dependent variable 
##D # of the outcome equation equal to the mid-points of the intervals
##D res <- selection( smoker ~ educ + age, cigs_intervals ~ educ, 
##D   data = Smoke, boundaries = bounds )
##D summary( res )
##D 
##D # estimation with starting values obtained by a two-step estimation 
##D # of a standard tobit-2 model with the dependent variable 
##D # of the outcome equation equal to the mid-points of the intervals
##D res2 <- selection( smoker ~ educ + age, cigs_intervals ~ educ, 
##D   data = Smoke, boundaries = bounds, start = "2step" )
##D summary( res2 )
## End(Not run)

# estimation with starting values that are very close to the estimates
# (in order to reduce the execution time of running this example) 
resS <- selection( smoker ~ educ + age, cigs_intervals ~ educ, 
  data = Smoke, boundaries = bounds, 
  start = c( 0.527, -0.0482, -0.0057, 4.23, -0.319, 2.97, 2.245 ) )
summary( resS )



