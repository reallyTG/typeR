library(BaM)


### Name: iq
### Title: iq data frame
### Aliases: iq

### ** Examples

## Not run: 
{
data(iq)
n <- length(iq[1,])
t.iq <- (iq[1,]-mean(as.numeric(iq)))/(sd(iq[1,])/sqrt(n))
r.t <- (rt(100000, n-1)*(sd(iq)/sqrt(n))) + mean(as.numeric(iq))
quantile(r.t,c(0.01,0.10,0.25,0.5,0.75,0.90,0.99))
r.sigma.sq <- 1/rgamma(100000,shape=(n-2)/2, rate=var(as.numeric(iq))*(n-1)/2)
quantile(sqrt(r.sigma.sq), c(0.01,0.10,0.25,0.5,0.75,0.90,0.99))
}
## End(Not run)



