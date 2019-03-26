library(JGL)


### Name: net.neighbors
### Title: Get network neighbors of a node
### Aliases: net.neighbors
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run fgl:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1,return.whole.theta=TRUE)
## get neighbors of gene 195:
net.neighbors(fgl.results$theta,index=195)




