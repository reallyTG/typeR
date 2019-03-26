library(FlexDir)


### Name: FD.estimation
### Title: Flexible Dirichlet Estimation
### Aliases: FD.estimation

### ** Examples

data <- FD.generate(n=20,a=c(12,7,15),p=c(0.3,0.4,0.3),t=8)
data
results <- FD.estimation(data, normalize=TRUE,iter.initial.SEM = 5,iter.final.EM = 10)
results
summary(results)




