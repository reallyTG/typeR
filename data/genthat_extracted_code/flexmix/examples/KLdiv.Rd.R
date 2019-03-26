library(flexmix)


### Name: KLdiv
### Title: Kullback-Leibler Divergence
### Aliases: KLdiv,matrix-method KLdiv,flexmix-method KLdiv,FLXMRglm-method
###   KLdiv,FLXMC-method
### Keywords: methods

### ** Examples

## Gaussian and Student t are much closer to each other than
## to the uniform:

x <- seq(-3, 3, length = 200)
y <- cbind(u = dunif(x), n = dnorm(x), t = dt(x, df = 10))

matplot(x, y, type = "l")
KLdiv(y)

if (require("mlbench")) {
set.seed(2606)
x <-  mlbench.smiley()$x
model1 <- flexmix(x ~ 1, k = 9, model = FLXmclust(diag = FALSE),
                  control  =  list(minprior = 0))
plotEll(model1, x)
KLdiv(model1)
}



