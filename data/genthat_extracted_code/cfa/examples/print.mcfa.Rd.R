library(cfa)


### Name: print.mcfa
### Title: Print an object of the class mcfa
### Aliases: print.mcfa
### Keywords: multivariate htest

### ** Examples

# library(cfa) if not yet loaded
# Some random configurations:
configs<-cbind(c("A","B")[rbinom(250,1,0.3)+1],c("C","D")[rbinom(250,1,0.1)+1],
          c("E","F")[rbinom(250,1,0.3)+1],c("G","H")[rbinom(250,1,0.1)+1])
counts1<-trunc(runif(250)*10) 
counts2<-trunc(runif(250)*10)
result<-cfa(configs,cbind(counts1,counts2))
print(result)



