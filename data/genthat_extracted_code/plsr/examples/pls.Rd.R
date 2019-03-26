library(plsr)


### Name: pls
### Title: Run partial least squares analysis
### Aliases: pls

### ** Examples

X = matrix(rnorm(300), ncol = 3)
Y = matrix(rnorm(1000), ncol = 10)
pls(X,Y)
pls(X,Y, n_perm = 10, n_boot = 10)
## No test: 
#running pls function on included data of the package
plsr_obj=pls(rating_data,tracking_data,1000,1000)
#inspecting results:
plot(plsr_obj)
summary(plsr_obj)
## End(No test)



