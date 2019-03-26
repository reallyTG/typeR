library(emulator)


### Name: estimator
### Title: Estimates each known datapoint using the others as datapoints
### Aliases: estimator
### Keywords: models

### ** Examples

# example has 40 observations on 6 dimensions.
# function is just sum( (1:6)*x) where x=c(x_1, ... , x_2)

val <- latin.hypercube(40,6)
colnames(val) <- letters[1:6]
d <- apply(val,1,function(x){sum((1:6)*x)})

#pick some scales:
fish <- rep(1,ncol(val))
A <- corr.matrix(val,scales=fish)

#add some suitably correlated noise:
d <- as.vector(rmvnorm(n=1, mean=d, 0.1*A))

# estimate d using the leave-out-one technique in estimator():
d.est <- estimator(val, A, d, scales=fish)

#and plot the result:
lims <- range(c(d,d.est))
par(pty="s")
plot(d, d.est, xaxs="r", yaxs="r", xlim=lims, ylim=lims)
abline(0,1)
  


