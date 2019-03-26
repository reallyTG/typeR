library(RLT)


### Name: RLT
### Title: Main function of reinforcement learning trees
### Aliases: RLT

### ** Examples


N = 600
P = 100

X = matrix(runif(N*P), N, P)
Y = rowSums(X[,1:5]) + rnorm(N)

trainx = X[1:200,]
trainy = Y[1:200]
testx = X[-c(1:200),]
testy = Y[-c(1:200)]

# Regular ensemble trees (Extremely Randomized Trees, Geurts, et. al., 2006)

RLT.fit = RLT(trainx, trainy, model = "regression", use.cores = 6)

barplot(RLT.fit$VarImp)
RLT.pred = predict(RLT.fit, testx)
mean((RLT.pred$Prediction - testy)^2)

# Reinforcement Learning Trees, using an embedded model to find the splitting rule
## Not run: 
##D Mark0 = proc.time()
##D RLT.fit = RLT(trainx, trainy, model = "regression", use.cores = 6, ntrees = 100,
##D               importance = TRUE, reinforcement = TRUE, combsplit = 3, embed.ntrees = 25)
##D proc.time() - Mark0
##D 
##D barplot(RLT.fit$VarImp)
##D RLT.pred = predict(RLT.fit, testx)
##D mean((RLT.pred$Prediction - testy)^2)
## End(Not run)



