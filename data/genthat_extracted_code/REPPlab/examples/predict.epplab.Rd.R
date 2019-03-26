library(REPPlab)


### Name: predict.epplab
### Title: Calculates projections for a new Data Object
### Aliases: predict,epplab-method predict-method predict.epplab
### Keywords: methods print

### ** Examples


library(tourr)
data(olive)
res <- EPPlab(olive[,3:10], PPalg="PSO", PPindex="KurtosisMin", n.simu=10, maxiter=20)

newData <- matrix(rnorm(80), ncol=8)

# Projection on the best direction
predict(res, data=newData)

# Projection on the best 3 directions
predict(res, which=1:3, data=newData)

# Similar with function fitted() when no data is given:
predict(res)
fitted(res)




