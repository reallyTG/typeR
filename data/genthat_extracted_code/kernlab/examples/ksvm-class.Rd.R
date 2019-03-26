library(kernlab)


### Name: ksvm-class
### Title: Class "ksvm"
### Aliases: ksvm-class SVindex alphaindex prob.model scaling prior show
###   param b obj nSV coef,vm-method SVindex,ksvm-method alpha,ksvm-method
###   alphaindex,ksvm-method cross,ksvm-method error,ksvm-method
###   param,ksvm-method fitted,ksvm-method prior,ksvm-method
###   prob.model,ksvm-method kernelf,ksvm-method kpar,ksvm-method
###   lev,ksvm-method kcall,ksvm-method scaling,ksvm-method
###   type,ksvm-method xmatrix,ksvm-method ymatrix,ksvm-method
###   b,ksvm-method obj,ksvm-method nSV,ksvm-method
### Keywords: classes

### ** Examples

## simple example using the promotergene data set
data(promotergene)

## train a support vector machine
gene <- ksvm(Class~.,data=promotergene,kernel="rbfdot",
             kpar=list(sigma=0.015),C=50,cross=4)
gene

# the kernel  function
kernelf(gene)
# the alpha values
alpha(gene)
# the coefficients
coef(gene)
# the fitted values
fitted(gene)
# the cross validation error
cross(gene)





