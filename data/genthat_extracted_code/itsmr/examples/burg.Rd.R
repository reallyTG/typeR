library(itsmr)


### Name: burg
### Title: Estimate AR coefficients using the Burg method
### Aliases: burg

### ** Examples

M = c("diff",1)
e = Resid(dowj,M)
a = burg(e,1)
print(a)



