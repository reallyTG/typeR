library(Umpire)


### Name: NormalVsCancer
### Title: Simulating Cancer Versus Normal Datasets
### Aliases: NormalVsCancerModel NormalVsCancerEngine

### ** Examples

nvc <- NormalVsCancerModel(10)
summary(nvc)
rand(nvc, 10)
rand(nvc, 10, balance=TRUE)
engine <- NormalVsCancerEngine(10)
dset <- rand(engine, 10, balance=TRUE)



