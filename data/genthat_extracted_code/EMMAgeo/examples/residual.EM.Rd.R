library(EMMAgeo)


### Name: residual.EM
### Title: Function to evaluate residual end-member loading.
### Aliases: residual.EM
### Keywords: EMMA

### ** Examples

## Some preparing steps to retrieve only robust end-members
## load example data, i.e. here TR
data(rEM, envir = environment())

## define mean robust end-member loadings
Vqn.rob <- rEM$Vqn.mean
## perform residual end-member loading calculation
Vqn.res <- residual.EM(Vqn.rob)

# Visualisation of the result
plot(NA, xlim = c(1, 80), ylim = c(0, 1))
for(i in 1:4) {lines(Vqn.rob[i,])}
lines(Vqn.res, col = 2)



