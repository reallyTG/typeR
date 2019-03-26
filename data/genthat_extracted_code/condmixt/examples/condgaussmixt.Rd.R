library(condmixt)


### Name: condgaussmixt
### Title: The conditional Gaussian mixture distribution
### Aliases: condgaussmixt pcondgaussmixt dcondgaussmixt

### ** Examples

# generate train data
ntrain <- 200
xtrain <- runif(ntrain)
ytrain <- rfrechet(ntrain,loc = 3*xtrain+1,scale =
0.5*xtrain+0.001,shape=xtrain+1)
plot(xtrain,ytrain,pch=22) # plot train data
qgen <- qfrechet(0.99,loc = 3*xtrain+1,scale = 0.5*xtrain+0.001,shape=xtrain+1)
points(xtrain,qgen,pch="*",col="orange")

h <- 4 # number of hidden units
m <- 2 # number of components

# initialize a conditional mixture with Gaussian components and a dirac at zero
thetainit <- condgaussmixt.init(1,h,m,ytrain)

# compute mixture parameters 
params.mixt <- condgaussmixt.fwd(thetainit,h,m,t(xtrain))

cdf <- pcondgaussmixt(params.mixt,m,ytrain) # compute CDF 




