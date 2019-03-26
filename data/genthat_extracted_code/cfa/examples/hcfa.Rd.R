library(cfa)


### Name: hcfa
### Title: Hierachical analysis of configuration frequencies
### Aliases: hcfa
### Keywords: multivariate htest

### ** Examples
# library(cfa) if not yet loaded
# Some random configurations:
configs<-cbind(c("A","B")[rbinom(250,1,0.3)+1],
c("C","D")[rbinom(250,1,0.1)+1],
c("E","F")[rbinom(250,1,0.3)+1],c("G","H")[rbinom(250,1,0.1)+1])
counts<-trunc(runif(250)*10)
hcfa(configs,counts) 



