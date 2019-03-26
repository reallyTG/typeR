library(liquidSVM)


### Name: command-args
### Title: liquidSVM command line options
### Aliases: command-args

### ** Examples

## Not run: 
##D reg <- liquidData('reg-1d')
##D model <- init.liquidSVM(Y~., reg$train)
##D trainSVMs(model, command.args=list(L=2, T=2, d=1))
##D selectSVMs(model, command.args=list(R=0,d=2))
##D result <- test(model, reg$test, command.args=list(T=1, d=0))
## End(Not run)



