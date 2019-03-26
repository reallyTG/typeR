library(Cprob)


### Name: plot.cpf
### Title: Plot method for cpf objects
### Aliases: plot.cpf
### Keywords: hplot survival

### ** Examples

data(mgus)
mgus$A <- ifelse(mgus$age < 64, 0, 1)

fit <- cpf(Hist(time, ev)~A, mgus)

plot(fit, curvlab = c("Age < 64", "Age >= 64"),
     main = "Conditional Probability of Cancer", xlab = "Years")



