library(RandomFields)


### Name: RFcovmatrix
### Title: Covariance matrix
### Aliases: RFcovmatrix
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)

##################################################
# Example: get covariance matrix C(x_i,x_j)    
# at given locations x_i, i=1,...,n 
#
# here for an isotropic stationary covariance model
# yields a 4 times 4 covariance matrix of the form
# C(0)   C(5)   C(3)   C(2.5)
# C(5)   C(0)   C(4)   C(2.5)
# C(3)   C(4)   C(0)   C(2.5)
# C(2.5) C(2.5) C(2.5) C(0)

model <- RMexp() # the covariance function C(x,y)=C(r) of this model
#                  depends only on the distance r between x and y
RFcovmatrix(model=model, distances=c(5,3,2.5,4,2.5,2.5), dim=4)


## Don't show: 
FinalizeExample()
## End(Don't show)


