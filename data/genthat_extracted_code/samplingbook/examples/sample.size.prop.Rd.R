library(samplingbook)


### Name: sample.size.prop
### Title: Sample Size Calculation for Proportion Estimation
### Aliases: sample.size.prop

### ** Examples

## 1) examples with different precisions
# precision 1% for election forecast of SPD in 2005
sample.size.prop(e=0.01, P=0.5, N=Inf)
data(election)
sample.size.prop(e=0.01, P=mean(election$SPD_02), N=Inf)
# precision 5% for questionnaire
sample.size.prop(e=0.05, P=0.5, N=300)
sample.size.prop(e=0.05, P=0.5, N=Inf)
# precision 10%
sample.size.prop(e=0.1, P=0.5, N=300)
sample.size.prop(e=0.1, P=0.5, N=1000)

## 2) tables in the book
# table 2.2
P_vector <- c(0.2, 0.3, 0.4, 0.5)
N_vector <- c(10, 100, 1000, 10000)
results <- matrix(NA, ncol=4, nrow=4)
for (i in 1:length(P_vector)){
  for (j in 1:length(N_vector)){
    x <- try(sample.size.prop(e=0.1, P=P_vector[i], N=N_vector[j]))
    if (class(x)=='try-error') {results[i,j] <- NA}
    else {results[i,j] <- x$n}
  }
}
dimnames(results) <- list(paste('P=',P_vector, sep=''), paste('N=',N_vector, sep=''))
results
# table 2.3
P_vector <- c(0.5, 0.1)
e_vector <- c(0.1, 0.05, 0.03, 0.02, 0.01)
results <- matrix(NA, ncol=2, nrow=5)
for (i in 1:length(e_vector)){
  for (j in 1:length(P_vector)){
    x <- try(sample.size.prop(e=e_vector[i], P=P_vector[j], N=Inf))
    if (class(x)=='try-error') {results[i,j] <- NA}
    else {results[i,j] <- x$n}
  }
}
dimnames(results) <- list(paste('e=',e_vector, sep=''), paste('P=',P_vector, sep=''))
results




