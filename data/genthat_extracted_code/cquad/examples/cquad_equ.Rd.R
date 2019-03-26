library(cquad)


### Name: cquad_equ
### Title: Conditional maximum likelihood estimation for the modified
###   version of the quadratic exponential model (to test for state
###   dependence)
### Aliases: cquad_equ
### Keywords: panel data

### ** Examples

# example based on simulated data
data(data_sim)
data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
id = data_sim$id; yv = data_sim$y; X = cbind(X1=data_sim$X1,X2=data_sim$X2)
# static model
out = cquad_equ(id,yv,X)



