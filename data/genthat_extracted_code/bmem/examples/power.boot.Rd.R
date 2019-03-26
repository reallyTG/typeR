library(bmem)


### Name: power.boot
### Title: Conducting power analysis based on bootstrap
### Aliases: power.boot

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
##D system.time(boot.non.normal<-power.boot(ex1model, indirect, N, 
##D  nrep=2000, nboot=10000, parallel='multicore', skewness=c(-.3, -.7, 1.3), 
##D  kurtosis=c(1.5, 0, 5), ovnames=c('ME', 'HE', 'math'), ncore=8, ci='percent', 
##D  boot.type='simple'))
##D summary(boot.non.normal)
## End(Not run)



