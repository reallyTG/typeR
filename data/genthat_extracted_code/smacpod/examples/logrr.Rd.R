library(smacpod)


### Name: logrr
### Title: Log ratio of spatial densities
### Aliases: logrr

### ** Examples

data(grave)
r = logrr(grave)
plot(r)
r2 = logrr(grave, sigma = spatstat::bw.scott)
plot(r2)
rsim = logrr(grave, nsim = 9)
plot(rsim)



