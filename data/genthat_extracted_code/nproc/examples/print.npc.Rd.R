library(nproc)


### Name: print.npc
### Title: Print the npc object.
### Aliases: print.npc

### ** Examples

n = 1000
x = matrix(rnorm(n*2),n,2)
c = 1+3*x[,1]
y = rbinom(n,1,1/(1+exp(-c)))
fit = npc(x, y, method = 'lda')
print(fit)



