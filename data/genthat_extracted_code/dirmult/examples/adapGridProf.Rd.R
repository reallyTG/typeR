library(dirmult)


### Name: adapGridProf
### Title: Profile log-likelihood of Dirichlet-multinomial model
### Aliases: adapGridProf

### ** Examples

data(us)
fit <- dirmult(us[[1]],epsilon=10^(-12),trace=FALSE)
adapGridProf(us[[1]],delta=0.5)
## Not run: adapGridProf(us[[1]],delta=qchisq(0.95,df=1)*2)



