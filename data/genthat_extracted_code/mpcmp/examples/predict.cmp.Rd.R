library(mpcmp)


### Name: predict.cmp
### Title: Model Predicitons for a 'glm.cmp' Object
### Aliases: predict.cmp

### ** Examples

data(takeoverbids)
M.bids <- glm.cmp(numbids ~ leglrest + rearest + finrest + whtknght 
    + bidprem + insthold + size + sizesq + regulatn, data=takeoverbids)

predict(M.bids)
predict(M.bids, type= "response")
predict(M.bids, se.fit=TRUE, type="response")

newdataframe <- data.frame(bidprem = 1, finrest = 0, insthold = 0.05,
    leglrest = 0, rearest = 1, regulatn = 0, size = 0.1, whtknght = 1, 
    sizesq = .1^2)
predict(M.bids, se.fit=TRUE, newdata = newdataframe, type="response")



