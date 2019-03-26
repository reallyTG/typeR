library(JGL)


### Name: JGL-package
### Title: Joint Graphical Lasso
### Aliases: JGL-package
### Keywords: package

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run FGL:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1)
str(fgl.results)
print.jgl(fgl.results)
## get subnetwork membership of FGL results:
subnetworks(fgl.results$theta)



