library(JGL)


### Name: net.degree
### Title: List the degree of every node in all classes.
### Aliases: net.degree
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run fgl:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1)
## get degree list:
net.degree(fgl.results$theta)




