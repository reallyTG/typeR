library(condmixt)


### Name: kneigh.condquant
### Title: Conditional quantile estimation from nearest neighbors.
### Aliases: kneigh.condquant

### ** Examples

# generate train data
ntrain <- 500
xtrain <- runif(ntrain) 
ytrain <- rfrechet(ntrain,loc = 3*xtrain+1,scale =
0.5*xtrain+0.001,shape=xtrain+1)
plot(xtrain,ytrain,pch=22) # plot train data
qgen <- qfrechet(0.99,loc = 3*xtrain+1,scale =
 0.5*xtrain+0.001,shape=xtrain+1) # compute quantile from generative model
points(xtrain,qgen,pch=".",col="orange")

kquant <- kneigh.condquant(t(xtrain),ytrain,p=0.99) # compute estimated quantile
                                                               
points(xtrain,kquant,pch="o",col="blue")
# sample quantiles are not good in the presence of heavy-tailed data


ytrain <- rlnorm(ntrain,meanlog = 3*xtrain+1,sdlog =
0.5*xtrain+0.001)
dev.new()
plot(xtrain,ytrain,pch=22) # plot train data
qgen <- qlnorm(0.99,meanlog = 3*xtrain+1,sdlog =
 0.5*xtrain+0.001) # compute quantile from generative model
points(xtrain,qgen,pch=".",col="orange")
# compute estimated quantile
kquant <- kneigh.condquant(t(xtrain),ytrain,p=0.99) 

points(xtrain,kquant,pch="o",col="blue") # a bit more reasonable 




