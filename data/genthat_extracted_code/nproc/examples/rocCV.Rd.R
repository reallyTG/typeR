library(nproc)


### Name: rocCV
### Title: Calculate the Receiver Operating Characteristics with
###   Cross-validation or Subsampling
### Aliases: rocCV

### ** Examples

n = 200
x = matrix(rnorm(n*2),n,2)
c = 1 - 3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
fit = rocCV(x, y, method = 'svm')
fit2 = rocCV(x, y, method = 'penlog')
fit3 = rocCV(x, y, method = 'penlog', metric = 'SS')



