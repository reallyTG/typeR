library(bmem)


### Name: power.basic
### Title: Conducting power analysis based on Sobel test
### Aliases: power.basic

### ** Examples

## Not run: 
##D ex1model<-'
##D math ~ c*ME+start(0)*ME + b*HE+start(0.39)*HE
##D HE ~ a*ME+start(0.39)*ME
##D '
##D 
##D indirect<-'ab:=a*b'
##D 
##D N<-50
##D 
##D system.time(non.normal<-power.basic(ex1model, indirect, N, 
##D  nrep=2000,parallel='multicore', skewness=c(-.3, -.7, 1.3), 
##D  kurtosis=c(1.5, 0, 5), ovnames=c('ME', 'HE', 'math'), ncore=8))
##D  
##D summary(non.normal)
##D 
## End(Not run)



