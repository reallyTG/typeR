library(grt)


### Name: subjdemo_cj
### Title: Sample dataset of a categorization experiment with 2D
###   conjunctive stimuli.
### Aliases: subjdemo_cj
### Keywords: datasets

### ** Examples

##### the data was generated using following codes:
m <- list(c(100,200),c(100,100),c(200,100),c(200,200))
covs <- diag(30^2, ncol=2, nrow=2)
set.seed(1)
subjdemo_cj <- grtrnorm(n=c(50,20,10,20), np=4, means=m, covs=covs)
subjdemo_cj$category <- c(1,2,2,2)[subjdemo_cj$category]
##### create ramdom responses with 80% accuracy
subjdemo_cj$response <- subjdemo_cj$category
set.seed(1)
incorrect <- sample(1:100, size=20)
subjdemo_cj$response[incorrect] <- abs(subjdemo_cj$response[incorrect] - 3)

##### plotting the dataset
with(subjdemo_cj, plot(x2 ~ x1, bg=category, pch=response))
abline(h=150, lty=2)
abline(v=150, lty=2)



