library(JGL)


### Name: net.edges
### Title: List the edges in a network
### Aliases: net.edges
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run fgl:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1)
## get edges list:
net.edges(fgl.results$theta)




