library(cquad)


### Name: cquad_ext
### Title: Conditional maximum likelihood estimation of the quadratic
###   exponential model for panel data
### Aliases: cquad_ext
### Keywords: panel data

### ** Examples

# example based on simulated data
data(data_sim)
data_sim = data_sim[1:500,]   # to speed up the example, remove otherwise
id = data_sim$id; yv = data_sim$y; X = cbind(X1=data_sim$X1,X2=data_sim$X2)
# static model
out = cquad_ext(id,yv,X)
summary(out)



