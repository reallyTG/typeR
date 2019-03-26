library(itsmr)


### Name: ia
### Title: Estimate MA coefficients using the innovations algorithm
### Aliases: ia

### ** Examples

M = c("diff",1)
e = Resid(dowj,M)
a = ia(e,1)
print(a)



