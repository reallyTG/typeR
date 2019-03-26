library(tsDyn)


### Name: extendBoot
### Title: extension of the bootstrap replications
### Aliases: extendBoot

### ** Examples

## Not run: 
##D # test with 10 bootstrap replications:
##D a<-setarTest(sun[1:100], m=1, nboot=10)
##D plot(a)
##D 
##D #use old results and compue 20 new replications
##D b<-extendBoot(a, n=20)
##D #see the different distributions:
##D plot(b)
## End(Not run)



