library(Tlasso)


### Name: Trnorm
### Title: Separable Tensor Normal Distribution
### Aliases: Trnorm

### ** Examples

 
m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
DATA=Trnorm(n,m.vec,type='Chain') 
# a 5*5*5*10 array of oberservation from 5*5*5 separable tensor 
#     normal distribtuion with mean zero and 
#         precision matrices from triangle graph




