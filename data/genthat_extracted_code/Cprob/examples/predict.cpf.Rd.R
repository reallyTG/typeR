library(Cprob)


### Name: predict.cpf
### Title: Conditional Probability Estimates at chosen timepoints
### Aliases: predict.cpf
### Keywords: survival

### ** Examples

data(mgus)
mgus$A <- ifelse(mgus$age < 64, 0, 1)

test <- cpf(Hist(time, ev)~A, data = mgus)

predict(test, c(10, 20))



