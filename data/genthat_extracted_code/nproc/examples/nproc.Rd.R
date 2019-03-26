library(nproc)


### Name: nproc
### Title: Calculate the Neyman-Pearson Receiver Operating Characteristics
### Aliases: nproc

### ** Examples

n = 200
x = matrix(rnorm(n*2),n,2)
c = 1 - 3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
#fit = nproc(x, y, method = 'svm')
fit2 = nproc(x, y, method = 'penlog')
##Plot the nproc curve
plot(fit2)

## Not run: 
##D fit3 = nproc(x, y, method = 'penlog',  n.cores = 2)
##D #In practice, replace 2 by the number of cores available 'detectCores()'
##D fit4 = nproc(x, y, method = 'penlog', n.cores = detectCores())
##D 
##D #Confidence nproc curves
##D fit6 = nproc(x, y, method = 'lda')
##D plot(fit6)
##D nproc ensembled version
##D fit7 = nproc(x, y, method = 'lda', split = 11)
##D plot(fit7)
## End(Not run)




