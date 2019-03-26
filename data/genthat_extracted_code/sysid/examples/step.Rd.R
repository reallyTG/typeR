library(sysid)


### Name: step
### Title: Step Response Plots
### Aliases: step

### ** Examples

uk <- rnorm(1000,1)
yk <- filter (uk,c(0.9,-0.4),method="recursive") + rnorm(1000,1)
data <- idframe(output=data.frame(yk),input=data.frame(uk))
fit <- impulseest(data)
step(fit) 




