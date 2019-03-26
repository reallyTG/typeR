library(ssMousetrack)


### Name: generate_data
### Title: Generate datasets according to the model structure
### Aliases: generate_data

### ** Examples


## Not run: 
##D ## Generate mouse-tracking data for an univariate experimental design 
##D ## with K = 3 categorical levels, J = 30 trials, I = 8 subjects
##D X1 <- generate_data(I=5,J=12,K=3,Z.formula="~Z1",M=50)
##D 
##D ## Generate mouse-tracking data for an univariate experimental design 
##D ## by varying priors of parameters
##D priors_list = list("normal(0,1)T(0,Inf)","normal(0,1)","normal(-2,0.5)")
##D X1 <- generate_data(I=5,J=12,K=3,Z.formula="~Z1",M=50,priors=priors_list)
##D 
##D ## Generate mouse-tracking data with two experimental factors Z1 and Z2, J = 9 trials, 
##D ## K_Z1 = 3, K_Z2 = 3, I = 5 subjects
##D X2 <- generate_data(I=5,J=9,K=c(3,3),Z.formula="~Z1*Z2",
##D Z.type=c("symmetric","random"),M=50) # design with interaction
## End(Not run)



