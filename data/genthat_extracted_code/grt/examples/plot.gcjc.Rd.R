library(grt)


### Name: plot.gcjc
### Title: Plot Method for Class 'gcjc'
### Aliases: plot.gcjc
### Keywords: multivariate

### ** Examples

m <- list(c(100,200),c(100,100),c(200,100),c(200,200))
covs <- diag(30^2, ncol=2, nrow=2)
set.seed(1)
CJ <- grtrnorm(n=c(50,20,10,20), np=4, means=m, covs=covs)
CJ$category <- c(1,2,2,2)[CJ$category]
#create ramdom responses with 80% accuracy
CJ$response <- CJ$category
set.seed(1)
incorrect <- sample(1:100, size=20)
CJ$response[incorrect] <- abs(CJ$response[incorrect] - 3)

#now fit the model
m.cj <- gcjc(response ~ x1 + x2, data=CJ, config=2, category=CJ$category, zlimit=7)

plot(m.cj)




