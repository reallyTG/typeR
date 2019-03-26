library(plsr)


### Name: print.plsr
### Title: Print plsr object
### Aliases: print.plsr

### ** Examples

X = matrix(rnorm(300),ncol=3)
Y = matrix(rnorm(1000),ncol = 10)
plsr_obj = pls(X,Y)
print(plsr_obj)



