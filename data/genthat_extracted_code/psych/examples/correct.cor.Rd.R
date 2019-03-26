library(psych)


### Name: correct.cor
### Title: Find dis-attenuated correlations given correlations and
###   reliabilities
### Aliases: correct.cor
### Keywords: models multivariate

### ** Examples


# attitude from the datasets package
#example 1 is a rather clunky way of doing things

a1 <- attitude[,c(1:3)]
a2 <- attitude[,c(4:7)]
x1 <- rowSums(a1)  #find the sum of the first 3 attitudes
x2 <- rowSums(a2)   #find the sum of the last 4 attitudes
alpha1 <- alpha(a1)
alpha2 <- alpha(a2)
x <- matrix(c(x1,x2),ncol=2)
x.cor <- cor(x)
alpha <- c(alpha1$total$raw_alpha,alpha2$total$raw_alpha)
round(correct.cor(x.cor,alpha),2)
#
#much better - although uses standardized alpha 
clusters <- matrix(c(rep(1,3),rep(0,7),rep(1,4)),ncol=2)
cluster.loadings(clusters,cor(attitude))
# or 
clusters <- matrix(c(rep(1,3),rep(0,7),rep(1,4)),ncol=2)
cluster.cor(clusters,cor(attitude))
#
#best
keys <- make.keys(attitude,list(first=1:3,second=4:7))
scores <- scoreItems(keys,attitude)
scores$corrected

#However, to do the more general case of correcting correlations for reliabilty
#corrected <- cor2cov(x.cor,1/alpha)
#diag(corrected) <- 1





