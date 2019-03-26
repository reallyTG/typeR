library(queueing)


### Name: CompareQueueingModels
### Title: Compare several queueing models in a tabulated format
### Aliases: CompareQueueingModels CompareQueueingModels2
### Keywords: CompareQueueingModels

### ** Examples


q1 <- QueueingModel(NewInput.MM1(lambda=5, mu=7))
q2 <- QueueingModel(NewInput.MMC(lambda=5, mu=3, c=4))
q3 <- QueueingModel(NewInput.MMInf(lambda=3, mu=4))
q4 <- QueueingModel(NewInput.MMCC(lambda=5, mu=3, c=4))

CompareQueueingModels(q1, q2, q3)
CompareQueueingModels2(list(q1, q2, q3, q4))




