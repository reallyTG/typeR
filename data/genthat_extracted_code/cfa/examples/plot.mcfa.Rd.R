library(cfa)


### Name: plot.mcfa
### Title: Plotting method for a mcfa object
### Aliases: plot.mcfa
### Keywords: multivariate htest

### ** Examples

# Some random configurations:
configs<-cbind(c("A","B")[rbinom(250,1,0.3)+1],c("C","D")[rbinom(250,1,0.1)+1],
          c("E","F")[rbinom(250,1,0.3)+1],c("G","H")[rbinom(250,1,0.1)+1])
counts1<-trunc(runif(250)*10)
counts2<-trunc(runif(250)*10)

plot(cfa(configs,cbind(counts1,counts2)))




