library(ops)


### Name: ops-package
### Title: Optimal Power Space Transformation
### Aliases: ops-package ops
### Keywords: package ~robust

### ** Examples

x=cbind(rexp(1000),rexp(1000))
p=findP(x)$maxIQR
y=x^p



