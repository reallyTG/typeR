library(nproc)


### Name: print.nproc
### Title: Print the nproc object.
### Aliases: print.nproc

### ** Examples

n = 1000
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
fit = nproc(x, y, method = 'lda')
print(fit)



