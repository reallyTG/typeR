library(JGL)


### Name: JGL
### Title: Joint Graphical Lasso
### Aliases: JGL
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load an example dataset with K=two classes, p=200 features, and n=100 samples per class:
data(example.data)
str(example.data)
## run fgl:
fgl.results = JGL(Y=example.data,penalty="fused",lambda1=.25,lambda2=.1)
str(fgl.results)
print.jgl(fgl.results)
## run ggl:
ggl.results = JGL(Y=example.data,penalty="group",lambda1=.15,lambda2=.2,return.whole.theta=TRUE)
str(ggl.results)
print.jgl(ggl.results)



