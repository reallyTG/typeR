library(deepNN)


### Name: dropoutProbs
### Title: dropoutProbs function
### Aliases: dropoutProbs

### ** Examples


## Not run: 
##D 
##D netwts <- train( dat=d,
##D                  truth=truth,
##D                  net=net,
##D                  eps=0.01,
##D                  tol=0.95,           # run for 100 iterations
##D                  batchsize=10,       # note this is not enough
##D                  loss=multinomial(), # for convergence
##D                  dropout=dropoutProbs(input=0.8,hidden=0.5))
## End(Not run)




