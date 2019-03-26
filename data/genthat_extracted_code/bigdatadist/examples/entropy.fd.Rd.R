library(bigdatadist)


### Name: entropy.fd
### Title: Functional Entropy Measures
### Aliases: entropy.fd
### Keywords: rkhs, Entropy

### ** Examples

data(Ausmale); t <- Ausmale[[1]]
t <- as.numeric(( t - min(t) ) / length(t))
raw.data <- fdframe(t=t, Y=Ausmale[[2]])

entropy.fd(raw.data,gamma=0.0001,kerfunc="rbf",kerpar=c(10), 
                        alpha=2, k.neighbor=15)



