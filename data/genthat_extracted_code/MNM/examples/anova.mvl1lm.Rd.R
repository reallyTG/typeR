library(MNM)


### Name: anova.mvl1lm
### Title: Comparisons between Multivariate Linear Models
### Aliases: anova.mvl1lm
### Keywords: methods

### ** Examples

# creating simple data

X <- cbind(rep(1,100),rmvnorm(100,c(0,0,0)) )
B <- matrix(c(4,1,1,0.5,-3,2,2,2),ncol=4, byrow=TRUE)
Y <- X %*% t(B)+ rmvnorm(100,c(0,0), diag(0.2,2))
DAT <- data.frame(x1=X[,2],x2=X[,3], x3=X[,4])

FullModel <- mv.l1lm(Y ~ x1 + x2 + x3, scores= "s", stand="i", data=DAT)
RestModel <- mv.l1lm(Y ~ x1, scores= "s", stand="i", data=DAT)

anova(FullModel)
anova(FullModel, RestModel)
anova(FullModel, RestModel, test="W")



