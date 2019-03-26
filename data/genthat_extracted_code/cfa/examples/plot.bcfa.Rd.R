library(cfa)


### Name: plot.bcfa
### Title: Plotting method for a bcfa object
### Aliases: plot.bcfa
### Keywords: multivariate htest

### ** Examples

# library(cfa) if not yet loaded
# Some random configurations:
configs<-cbind(c("A","B")[rbinom(250,1,0.3)+1],c("C","D")[rbinom(250,1,0.1)+1],
          c("E","F")[rbinom(250,1,0.3)+1],c("G","H")[rbinom(250,1,0.1)+1])
counts<-trunc(runif(250)*10)
plot(bcfa(configs,counts,runs=25))



