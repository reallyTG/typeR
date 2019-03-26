library(adegenet)


### Name: global.rtest
### Title: Global and local tests
### Aliases: global.rtest local.rtest
### Keywords: multivariate spatial

### ** Examples

## Not run: 
##D  data(sim2pop)
##D if(require(spdep)){
##D cn <- chooseCN(sim2pop@other$xy,ask=FALSE,type=1,plot=FALSE,res="listw")
##D 
##D # global test
##D Gtest <- global.rtest(sim2pop@tab,cn)
##D Gtest
##D 
##D # local test
##D Ltest <- local.rtest(sim2pop@tab,cn)
##D Ltest
##D }
## End(Not run)



