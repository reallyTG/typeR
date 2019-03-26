library(cquad)


### Name: cquad-package
### Title: Conditional Maximum Likelihood for Quadratic Exponential Models
###   for Binary Panel Data
### Aliases: cquad-package
### Keywords: panel data

### ** Examples

# example based on simulated data
data(data_sim)
data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
# static model
out1 = cquad(y~X1+X2,data_sim,100)
# dynamic model
out2 = cquad(y~X1+X2,data_sim,100,dyn=TRUE)



