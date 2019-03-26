library(cquad)


### Name: cquad_basic
### Title: Conditional maximum likelihood estimation of the basic quadratic
###   exponential model
### Aliases: cquad_basic
### Keywords: panel data

### ** Examples

# example based on simulated data
data(data_sim)
data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
id = data_sim$id; yv = data_sim$y; X = cbind(X1=data_sim$X1,X2=data_sim$X2)
# static model
out1 = cquad_basic(id,yv,X)
summary(out1)
# dynamic model
out2 = cquad_basic(id,yv,X,dyn=TRUE)
summary(out2)



