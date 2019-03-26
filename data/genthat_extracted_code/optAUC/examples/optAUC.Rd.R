library(optAUC)


### Name: optAUC
### Title: Optimal Combinations of Diagnostic Tests Based on AUC
### Aliases: optAUC
### Keywords: ~kwd1 ~kwd2

### ** Examples

library(MASS)
rho<-0
m<-50
n<-50
y1.sd<-0.5
y2.sd<-0.5 
y1.mean<-2
y2.mean<-1
lambda <- 5

set.seed(88)
# generate non-diseased population F(X1, X2)
# the sample from 2-dimensinal multinormal distribution with mean 0 and std=1
X1X2<-mvrnorm(m, c(1,1), matrix(c(0.5,rho,rho,0.5),2,2))

# generate  diseased population G(Y1,Y2)
# the sample from 2-dimensinal multinormal distribution with mean
# (y1.mean,y2.mean) and std=(y1.sd,y2.sd) 
Y1Y2<-mvrnorm(n, c(y1.mean,y2.mean), matrix(c(y1.sd^2,rho*y1.sd*y2.sd, rho*y1.sd*y2.sd, y2.sd^2),2,2))

# only the first marker, the "true" model, should have the maximum AUC amount all models
optAUC(X1X2, Y1Y2, column.select=1)
# two markers in the model, the AUC from GCV is smaller than just first marker in the model, because the second marker is noise
# the AUC from ACV (apearent estimate by substituting the estimated beta into the model) is larger than previous model, because overfitting
optAUC(X1X2, Y1Y2, column.select=c(1:2))



