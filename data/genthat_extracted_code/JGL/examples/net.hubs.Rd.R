library(JGL)


### Name: net.hubs
### Title: Get degrees of most connected nodes.
### Aliases: net.hubs
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run fgl:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1)
## get hubs list:
net.hubs(fgl.results$theta)



