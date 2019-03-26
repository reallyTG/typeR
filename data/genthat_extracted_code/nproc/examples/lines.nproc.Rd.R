library(nproc)


### Name: lines.nproc
### Title: Add NP-ROC curves to the current plot object.
### Aliases: lines.nproc

### ** Examples

n = 1000
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
fit = nproc(x, y, method = 'nb')
plot(fit)
fit2 = nproc(x, y, method = 'lda')
lines(fit2, col = 2)



