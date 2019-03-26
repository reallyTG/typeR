library(sysid)


### Name: impulseest
### Title: Estimate Impulse Response Coefficients
### Aliases: impulseest

### ** Examples

uk <- rnorm(1000,1)
yk <- filter (uk,c(0.9,-0.4),method="recursive") + rnorm(1000,1)
data <- idframe(output=data.frame(yk),input=data.frame(uk))
fit <- impulseest(data)
impulseplot(fit)




