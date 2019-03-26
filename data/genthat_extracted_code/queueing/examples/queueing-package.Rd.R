library(queueing)


### Name: queueing-package
### Title: Analysis of Queueing Networks and Models.
### Aliases: queueing-package queueing
### Keywords: queueing

### ** Examples


## M/M/1 model
summary(QueueingModel(NewInput.MM1(lambda=1/4, mu=1/3, n=0)))

## M/M/1/K model
summary(QueueingModel(NewInput.MM1K(lambda=1/4, mu=1/3, k=3)))




